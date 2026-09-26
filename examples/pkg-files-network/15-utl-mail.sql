alter session set smtp_out_server = 'host.docker.internal:2525';

begin
  utl_mail.send(sender     => 'ops@nimbus.example',
                recipients => 'crew.dxb@nimbus.example',
                cc         => 'duty.manager@nimbus.example',
                subject    => 'NM150 gate change',
                message    => 'NM150 now departs from gate B12.');
  utl_mail.send_attach_varchar2(
                sender     => 'ops@nimbus.example',
                recipients => 'crew.dxb@nimbus.example',
                subject    => 'Morning departures',
                message    => 'The list is attached.',
                attachment => 'NM113,ORD,01:05' || chr(10) || 'NM101,LHR,02:05',
                att_mime_type => 'text/csv',
                att_filename  => 'departures.csv');
end;
/
