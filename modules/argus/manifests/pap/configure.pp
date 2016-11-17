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
  $pap_consistency_check_repair = $argus::params::pap_consistency_check_repair,
  $pap_env_file                 = $argus::params::pap_env_file,
  $pap_home                     = $argus::params::pap_home,
  $pap_pid                      = $argus::params::pap_pid,
  $pap_java_opts                = $argus::params::pap_java_opts,) inherits argus::params {
  require argus::commons
  require argus::pap::install

  File {
    owner => root,
    group => root,
  }

  file {
    'pap_conf_dir':
      ensure => directory,
      path   => $pap_conf_dir,;

    'pap_admin':
      ensure  => file,
      path    => $pap_admin_prop,
      content => template('argus/pap-admin.properties.erb'),;

    'pap_auth':
      ensure  => file,
      path    => $pap_auth,
      content => template('argus/pap_authorization.ini.erb'),;

    'pap_conf':
      ensure  => file,
      path    => $pap_conf,
      content => template('argus/pap_configuration.ini.erb'),;

    'pap_env_file':
      ensure  => file,
      path    => $pap_env_file,
      content => template('argus/argus-pap.erb'),
  }

  File['pap_conf_dir'] -> File[['pap_admin', 'pap_auth', 'pap_conf']] -> File['pap_env_file']
}
