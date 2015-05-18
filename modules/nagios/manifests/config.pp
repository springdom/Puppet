class nagios::config {
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


   nagios_contactgroup {'sysadmins':
     target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
     alias => 'Systems Administrators',
     members => 'taylomj5',
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
              check_command => 'check_mysql',
              max_check_attempts => 3,
              retry_check_interval => 1,
              normal_check_interval => 5,
              check_period => '24x7',
              notification_interval => 30,
              notification_period => '24x7',
              notification_options => 'w,u,c',
              contact_groups => 'sysadmins',
  }
    nagios_hostgroup{'db-servers':
              target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
              alias => 'Database Servers',
              members => 'db.sqrawler.com',
  }
}

