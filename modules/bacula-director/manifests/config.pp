class bacula-director::config {
    file { "/etc/bacula/bacula-dir.conf":
      ensure => present,
      source => "puppet:///modules/bacula-director/bacula-dir.conf",
      owner => "root",
      group => "root",
      mode => 0555,
      require => Class["bacula-director::install"],
      notify => Class["bacula-director::service"],
   }
}

