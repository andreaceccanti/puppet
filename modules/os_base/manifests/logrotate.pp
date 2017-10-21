class os_base::logrotate {
  package { 'logrotate': ensure => latest, }

  file { '/etc/logrotate.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['logrotate'],
    content => template('os_base/logrotate.conf.erb'),
  }
}
