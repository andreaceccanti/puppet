class argus::pap::configure (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_port

) {
  require argus::commons
  require argus::pap::install

  file {
    'pap_conf_dir':
      path   => $argus::params::pap_conf_dir,
      ensure => directory;

    'pap_admin':
      path    => $argus::params::pap_admin_prop,
      ensure  => file,
      content => template('argus/pap-admin.properties.erb');

    'pap_auth':
      path    => $argus::params::pap_auth,
      ensure  => file,
      content => template('argus/pap_authorization.ini.erb');

    'pap_conf':
      path    => $argus::params::pap_conf,
      ensure  => file,
      content => template('argus/pap_configuration.ini.erb');
  }

  File['pap_conf_dir'] -> File[['pap_admin', 'pap_auth', 'pap_conf']]
}
