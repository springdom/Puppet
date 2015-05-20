class nagios::config {

    nagios_host { 'mgmt.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'mgmt',
                 address => '10.25.1.39',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
                 notifications_enabled => '1',
                 event_handler_enabled => '1',
                 flap_detection_enabled => '1',
                 failure_prediction_enabled => '1',
                 process_perf_data => '1',
                 retain_status_information => '1',
                 retain_nonstatus_information => '1',
                 notify => Class["nagios::service"]
   }

  nagios_host { 'db.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'db',
                 address => '10.25.1.37',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
		 notifications_enabled => '1',
		 event_handler_enabled => '1',
		 flap_detection_enabled => '1',
		 failure_prediction_enabled => '1',
		 process_perf_data => '1',
		 retain_status_information => '1',
		 retain_nonstatus_information => '1',
		 notify => Class["nagios::service"]
   }
  nagios_host { 'app.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'app',
                 address => '10.25.1.38',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
		 notifications_enabled => '1',
		 event_handler_enabled => '1',
		 flap_detection_enabled => '1',
		 failure_prediction_enabled => '1',
		 process_perf_data => '1',
		 retain_status_information => '1',
		 retain_nonstatus_information => '1',
		 notify => Class["nagios::service"]
   }

  nagios_host { 'storage.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'storage',
                 address => '10.25.1.36',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
		 notifications_enabled => '1',
		 event_handler_enabled => '1',
		 flap_detection_enabled => '1',
		 failure_prediction_enabled => '1',
		 process_perf_data => '1',
		 retain_status_information => '1',
		 retain_nonstatus_information => '1',
		 notify => Class["nagios::service"]
   }

  nagios_host { 'ad.sqrawler.com':
                 target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
                 alias => 'ad',
                 address => '10.25.1.40',
                 check_period => '24x7',
                 max_check_attempts => 3,
                 check_command => 'check-host-alive',
                 notification_interval => 30,
                 notification_period => '24x7',
                 notification_options => 'd,u,r',
                 contact_groups => 'sysadmins',
		 notifications_enabled => '1',
		 event_handler_enabled => '1',
		 flap_detection_enabled => '1',
		 failure_prediction_enabled => '1',
		 process_perf_data => '1',
		 retain_status_information => '1',
		 retain_nonstatus_information => '1',
		 notify => Class["nagios::service"]
   }
  nagios_hostgroup { 'debian-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'Debian Servers',
	members => 'mgmt.sqrawler.com, app.sqrawler.com, storage.sqrawler.com, db.sqrawler.com',
	notify => Class["nagios::service"],
  }

  nagios_contactgroup {'sysadmins':
     target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
     alias => 'Systems Administrators',
     members => 'taylomj5',
     notify => Exec['fix-file-permissions'],
  }
  nagios_contact { 'taylomj5':
         target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
         alias => 'Matthew Taylor',
         service_notification_period => '24x7',
         host_notification_period => '24x7',
         service_notification_options => 'w,u,c,r',
         host_notification_options => 'd,r',
         service_notification_commands => 'notify-service-by-email, notify-service-by-whatsapp',
         host_notification_commands => 'notify-host-by-email, notify-host-by-whatsapp',
         email => 'manly13@hotmail.com',
         notify => Class["nagios::service"],
         pager => '64212926567',
  }
  nagios_service {'MySQL':
              service_description => 'MySQL DB',
              hostgroup_name => 'db-servers',
              target => '/etc/nagios3/conf.d/ppt_mysql_service.cfg',
              check_command => 'check_mysql_cmdlinecred!$USER3$!$USER4$',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }

  nagios_service {'HTTP':
              service_description => 'HTTP',
              hostgroup_name => 'http-servers',
              target => '/etc/nagios3/conf.d/ppt_http_service.cfg',
              check_command => 'check_http',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }
  nagios_service { 'SSH':
	service_description => 'SSH',
	check_command => 'check_ssh',
	hostgroup_name => 'ssh-servers',
	target => '/etc/nagios3/conf.d/ppt_ssh_service.cfg',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
       check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',
  }
  nagios_service { 'DiskSpace':
	service_description => 'Disk Space',
	hostgroup_name => 'debian-servers',
	target => '/etc/nagios3/conf.d/ppt_diskspace_service.cfg',
	check_command => 'check_nrpe_1arg!check_hd',	
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',

  }
  nagios_service { 'CPU Load':
	service_description => 'CPU Load',
	hostgroup_name => 'debian-servers',
	target => '/etc/nagios3/conf.d/ppt_cpuload.cfg',
	check_command => 'check_nrpe_1arg!check_load',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',

  }
  nagios_service { 'Process Check':
	service_description => 'Processes',
	hostgroup_name => 'debian-servers',
	target => '/etc/nagios3/conf.d/ppt_process.cfg',
	check_command => 'check_nrpe_1arg!check_procs',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',

  }
  nagios_service { 'Users Check':
	service_description => 'Users',
	hostgroup_name => 'debian-servers',
	target => '/etc/nagios3/conf.d/ppt_users.cfg',
	check_command => 'check_nrpe_1arg!check_users',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',
  }
###WINDOWS SERVICES###

  nagios_service { 'NS Client Version':
	service_description => 'NSClient++ Version',
	hostgroup_name => 'windows-servers',
	check_command => 'check_nt!CLIENTVERSION',
	target => '/etc/nagios3/conf.d/ppt_nsclient.cfg',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',

 }

  nagios_service { 'Windows Uptime':
	service_description => 'Uptime',
	hostgroup_name => 'windows-servers',
	check_command => 'check_nt!UPTIME',
	target => '/etc/nagios3/conf.d/ppt_winuptime.cfg',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',

  }
  nagios_service { 'Windows CPU Load':
	service_description => 'CPU Load',
	hostgroup_name => 'windows-servers',
	check_command => 'check_nt!CPULOAD!-l 5,80,90',
	target => '/etc/nagios3/conf.d/ppt_wincpuload.cfg',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',
	}

  nagios_service { 'Windows Mem Usage':
	service_description => 'Memory Usage',
	hostgroup_name => 'windows-servers',
	check_command => 'check_nt!MEMUSE!-w 80 -c 90',
	target => '/etc/nagios3/conf.d/ppt_winmem.cfg',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins', 
 }
  nagios_service { 'Windows Disk Usage':
	service_description => 'Disk Space',
	hostgroup_name => 'windows-servers',
	check_command => 'check_nt!USEDDISKSPACE!-l c -w 80 -c 90',
	target => '/etc/nagios3/conf.d/ppt_windisk.cfg',
        max_check_attempts => 3,
        retry_check_interval => 1,
        normal_check_interval => 5,
        check_period => '24x7',
        notification_interval => 30,
        notification_period => '24x7',
        notification_options => 'w,u,c',
        contact_groups => 'sysadmins',
  }
###WINDOWS SERVICES END###
  nagios_hostgroup{'windows-servers':
         target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
         alias => 'Windows Servers',
         members => 'ad.sqrawler.com',
  }
  nagios_hostgroup{'db-servers':
         target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
         alias => 'Database Servers',
         members => 'db.sqrawler.com',
  }
  nagios_hostgroup { 'http-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'HTTP Servers',
	members => 'mgmt.sqrawler.com',
	notify => Class["nagios::service"],
  }
  nagios_hostgroup { 'ssh-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'SSH Servers',
	members => 'app.sqrawler.com, db.sqrawler.com, mgmt.sqrawler.com, storage.sqrawler.com',
	notify => Class["nagios::service"],
  }
}

