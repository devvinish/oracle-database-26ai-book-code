// A small local test server for the networking examples of Chapter 54, so that they need no
// Internet service and send no real e-mail. Run it on the machine that hosts the database
// container (Node.js 18 or later):
//   node setup/netlab/server.mjs
// HTTP on port 8099 (the database reaches it as host.docker.internal:8099):
//   GET  /flights/NM150/status   a flight status in JSON
//   GET  /fx?base=USD            exchange rates in JSON
//   GET  /notices                a few lines of text
//   GET  /old-status             redirects to /flights/NM150/status
//   GET  /reports/daily          needs basic authentication (user ops, password ops-demo)
//   POST /bookings               echoes the JSON it receives, with a new booking reference
// SMTP on port 2525: accepts every message, delivers nothing, and prints each one here.
import http from 'node:http';
import net from 'node:net';

const HTTP_PORT = Number(process.env.HTTP_PORT || 8099);
const SMTP_PORT = Number(process.env.SMTP_PORT || 2525);

const json = (res, code, body, headers = {}) => {
  res.writeHead(code, { 'Content-Type': 'application/json', 'X-Server': 'nimbus-netlab', ...headers });
  res.end(JSON.stringify(body));
};

http.createServer((req, res) => {
  const url = new URL(req.url, `http://${req.headers.host}`);
  let body = '';
  req.on('data', (c) => { body += c; });
  req.on('end', () => {
    if (req.method === 'GET' && url.pathname === '/flights/NM150/status') {
      return json(res, 200, { flight: 'NM150', status: 'ON TIME', gate: 'B12', departs: '2026-03-15T22:10:00+13:00' });
    }
    if (req.method === 'GET' && url.pathname === '/fx') {
      return json(res, 200, { base: url.searchParams.get('base') || 'USD', date: '2026-03-15', rates: { AED: 3.6725, EUR: 0.9184, INR: 86.95 } });
    }
    if (req.method === 'GET' && url.pathname === '/notices') {
      res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
      return res.end('Gate B12: boarding from 21:30\nLounge: open until 23:00\nWi-Fi: NimbusGuest\n');
    }
    if (req.method === 'GET' && url.pathname === '/old-status') {
      res.writeHead(302, { Location: '/flights/NM150/status' });
      return res.end();
    }
    if (req.method === 'GET' && url.pathname === '/reports/daily') {
      const auth = req.headers.authorization || '';
      if (auth !== 'Basic ' + Buffer.from('ops:ops-demo').toString('base64')) {
        return json(res, 401, { error: 'authentication required' }, { 'WWW-Authenticate': 'Basic realm="ops"' });
      }
      return json(res, 200, { date: '2026-03-15', flights: 31, on_time_pct: 87.1 });
    }
    if (req.method === 'POST' && url.pathname === '/bookings') {
      let doc;
      try { doc = JSON.parse(body); } catch { return json(res, 400, { error: 'invalid JSON' }); }
      return json(res, 201, { booking_ref: 'NX7Q2P', received: doc, bytes: Buffer.byteLength(body) });
    }
    json(res, 404, { error: 'not found' });
  });
}).listen(HTTP_PORT, () => console.log(`HTTP on port ${HTTP_PORT}`));

let queued = 0;
net.createServer((sock) => {
  let data = false;
  let msg = '';
  let buf = '';
  const say = (s) => sock.write(s + '\r\n');
  say('220 netlab ESMTP ready (test server, nothing is delivered)');
  sock.on('data', (chunk) => {
    buf += chunk.toString('utf8');
    let i;
    while ((i = buf.indexOf('\r\n')) >= 0) {
      const line = buf.slice(0, i);
      buf = buf.slice(i + 2);
      if (data) {
        if (line === '.') {
          data = false;
          queued += 1;
          console.log(`--- message ${queued} ---\n${msg}--- end ---`);
          msg = '';
          say(`250 2.0.0 queued as NL${String(queued).padStart(4, '0')}`);
        } else msg += line.replace(/^\./, '') + '\n';
        continue;
      }
      const cmd = line.slice(0, 4).toUpperCase();
      if (cmd === 'EHLO') { say('250-netlab greets you'); say('250-8BITMIME'); say('250 SIZE 10485760'); }
      else if (cmd === 'HELO') say('250 netlab');
      else if (cmd === 'MAIL' || cmd === 'RCPT' || cmd === 'RSET' || cmd === 'NOOP') say('250 2.1.0 OK');
      else if (cmd === 'VRFY') say('252 2.1.5 cannot verify, will accept');
      else if (cmd === 'DATA') { data = true; say('354 end data with <CR><LF>.<CR><LF>'); }
      else if (cmd === 'QUIT') { say('221 2.0.0 bye'); sock.end(); }
      else say('502 5.5.2 command not implemented');
    }
  });
  sock.on('error', () => {});
}).listen(SMTP_PORT, () => console.log(`SMTP on port ${SMTP_PORT}`));
