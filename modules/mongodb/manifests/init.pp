class mongodb inherits mongodb::params {
  package { $mongodb::params::serverpkg: ensure => installed }

  package { $mongodb::params::clientpkg: ensure => installed }

  service { $mongodb::params::service:
    ensure    => running,
    enable    => true,
    subscribe => File[$mongodb::params::conf_file];
  }

  file {
    $mongodb::params::conf_file:
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('mongodb/mongodb.conf.erb');

    $mongodb::params::logdir:
      ensure  => directory,
      owner   => $mongodb::params::user,
      group   => $mongodb::params::group,
      mode    => '0755',
      require => Package[$mongodb::params::serverpkg];

    $mongodb::params::libdir:
      ensure  => directory,
      owner   => $mongodb::params::user,
      group   => $mongodb::params::group,
      mode    => '0755',
      require => Package[$mongodb::params::serverpkg];
  }

  Package[$mongodb::params::serverpkg] -> File[$mongodb::params::conf_file] -> Service[$mongodb::params::service]
}