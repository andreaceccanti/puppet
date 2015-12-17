class rsyslog inherits rsyslog::params {
  package { $rsyslog::params::pkgname: ensure => installed }

  service { $rsyslog::params::service_name:
    ensure    => running,
    enable    => true,
    restart   => $rsyslog::params::restart_cmd,
    require   => Package[$rsyslog::params::pkgname],
    subscribe => [File[$rsyslog::params::conf_file], File[$rsyslog::params::sender_conf]];
  }

  file {
    $rsyslog::params::conf_file:
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('rsyslog/rsyslog.conf.erb'),
      require => Package[$rsyslog::params::pkgname];

    $rsyslog::params::sender_conf:
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('rsyslog/syslog-sender.conf.erb');
  }
}