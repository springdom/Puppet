class nagios::install {
  package { "nagios3" :
            ensure => present,
            require => User["nagios"],
  }
  package { "nagios-nrpe-plugin":
  	     ensure => present,
	     require => Package["nagios3"]  
  }
  exec { "set-group":
 	command => "/bin/chown root:puppet /etc/nagios3/conf.d",
	require => Package["nagios3"]
  }
  exec { "set-perms":
	command => "/bin/chmod 775 /etc/nagios3/conf.d",
	require => Package["nagios3"]
  }
  user { "nagios":
      ensure => present,
        comment => "Nagios user",
        gid => "nagios",
        shell => "/bin/false",
        require => Group["nagios"],
  }
  group { "nagios" :
          ensure => present,
  }
}

