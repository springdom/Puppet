class bacula-storage::config {
    file { "/etc/bacula/bacula-sd.conf":
      ensure => present,
      source => "puppet:///modules/bacula-storage/bacula-sd.conf",
      owner => "root",
      group => "root",
      mode => 0555,
      require => Class["bacula-storage::install"],
      notify => Class["bacula-storage::service"],
    }
 }

