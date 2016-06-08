class os::yum_update {
  package { 'yum-cron': ensure => latest, }

  service { 'yum-cron':
    ensure  => running,
    enable  => true,
    require => Package['yum-cron'],
  }

}
