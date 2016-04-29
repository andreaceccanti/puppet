class argus::pap::configure (
  $pap_host                     = $argus::params::pap_host,
  $pap_port                     = $argus::params::pap_port,
  $pap_conf_dir                 = $argus::params::pap_conf_dir,
  $pap_admin_prop               = $argus::params::pap_admin_prop,
  $pap_auth                     = $argus::params::pap_auth,
  $pap_conf                     = $argus::params::pap_conf,
  $pap_shutdown_command         = $argus::params::pap_shutdown_port,
  $pap_poll_interval            = $argus::params::pap_poll_interval,
  $pap_ordering                 = $argus::params::pap_ordering,
  $pap_consistency_check        = $argus::params::pap_consistency_check,
  $pap_consistency_check_repair = $argus::params::pap_consistency_check_repair

) inherits argus::params {

  require argus::commons
  require argus::pap::install

  file {
    'pap_conf_dir':
      path   => $pap_conf_dir,
      ensure => directory;

    'pap_admin':
      path    => $pap_admin_prop,
      ensure  => file,
      content => template('argus/pap-admin.properties.erb');

    'pap_auth':
      path    => $pap_auth,
      ensure  => file,
      content => template('argus/pap_authorization.ini.erb');

    'pap_conf':
      path    => $pap_conf,
      ensure  => file,
      content => template('argus/pap_configuration.ini.erb');
  }

  File['pap_conf_dir'] -> File[['pap_admin', 'pap_auth', 'pap_conf']]
}
