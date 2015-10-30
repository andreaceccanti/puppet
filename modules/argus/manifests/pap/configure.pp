class argus::pap::configure inherits argus::pap::params {
  require argus::pap::install

  file {
    'pap_conf_dir':
      path   => $argus::pap::params::conf_dir,
      ensure => directory;

    'pap_admin':
      path    => $argus::pap::params::pap_admin_prop,
      ensure  => file,
      content => template('argus/pap-admin.properties.erb');

    'pap_auth':
      path    => $argus::pap::params::pap_auth,
      ensure  => file,
      content => template('argus/pap_authorization.ini.erb');

    'pap_conf':
      path    => $argus::pap::params::pap_conf,
      ensure  => file,
      content => template('argus/pap_configuration.ini.erb');
  }

  File['pap_conf_dir'] -> File[['pap_admin', 'pap_auth', 'pap_conf']]
}