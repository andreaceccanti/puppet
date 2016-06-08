class storm::storm_webdav ($vo_list = []) inherits storm::storm_webdav::params {
  require storm::commons

  $_storm_user = $storm::params::user

  package { 'storm-webdav': ensure => installed, }

  service { 'storm-webdav':
    ensure     => running,
    enable     => true,
    hasrestart => false,
  }

  file {
    'sysconf':
      ensure  => file,
      path    => $storm::storm_webdav::params::sysconfig_file,
      content => template('storm/storm-webdav.erb'),
      notify  => Service['storm-webdav'],;

    'keydir':
      ensure => directory,
      path   => $storm::storm_webdav::params::srv_keydir,
      owner  => $_storm_user,
      group  => $_storm_user,;

    'cert_pub':
      ensure => file,
      path   => $storm::storm_webdav::params::certificate_path,
      owner  => $_storm_user,
      group  => $_storm_user,
      source => '/etc/grid-security/hostcert.pem',;

    'priv_key':
      ensure => file,
      path   => $storm::storm_webdav::params::private_key_path,
      owner  => $_storm_user,
      group  => $_storm_user,
      source => '/etc/grid-security/hostkey.pem',;
  }

  storm::storm_webdav::storage_areas::sa_prop_file { $vo_list: }

  storm::utils::sa_storage_dir { $vo_list: }

  Package['storm-webdav'] -> File['sysconf'] -> File['keydir'] -> File['cert_pub'] -> File['priv_key'] -> Service['storm-webdav']

}
