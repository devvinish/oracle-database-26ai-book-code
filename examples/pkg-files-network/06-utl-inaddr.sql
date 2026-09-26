select utl_inaddr.get_host_address('host.docker.internal') as test_server,
       utl_inaddr.get_host_address('localhost')            as localhost,
       utl_inaddr.get_host_name('127.0.0.1')               as name_of_127;
