class rsyslog::logserver inherits rsyslog::params {
  include mongodb

  package { 'httpd': ensure => installed }

  package { 'php': ensure => installed }

  package { 'php-gd': ensure => installed }

  package { 'php-pecl-mongo': ensure => installed }

  package { 'php-bcmath': ensure => installed }

  package { $rsyslog::params::mongo_module: ensure => installed }

  package { $rsyslog::params::json_module: ensure => installed }

  $pkg_list = [
    $rsyslog::params::pkgname,
    $rsyslog::params::mongo_module,
    $rsyslog::params::json_module]

  service { 'httpd':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/httpd restart';
  }

  exec { 'rsyslog_downgrade':
    command => $rsyslog::params::downgrade_command,
    onlyif  => $rsyslog::params::downgrade_test
  }

  file {
    $rsyslog::params::repofile:
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template($rsyslog::params::repotmpl);

    $rsyslog::params::module_conf:
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('rsyslog/ommongodb.conf.erb'),
      notify  => Service[$rsyslog::params::service_name];
  }

  Service[$mongodb::params::service] -> File[$rsyslog::params::repofile] -> Package[$pkg_list] -> 
  Exec['rsyslog_downgrade']
}
