class nagios::service {
  service { "nagios3" :
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["nagios::config"],
  }
  
  exec { "fix-file-permissions" :
	command => "/bin/chmod -R 644 /etc/nagios3/conf.d/*",
	require => Class["nagios::config"],
  }
}

