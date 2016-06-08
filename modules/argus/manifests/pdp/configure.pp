class argus::pdp::configure (
  $pap_host               = $argus::params::pap_host,
  $pap_port               = $argus::params::pap_port,
  $pdp_host               = $argus::params::pdp_host,
  $pdp_port               = $argus::params::pdp_port,
  $pdp_conf_dir           = $argus::params::pdp_conf_dir,
  $pdp_conf               = $argus::params::pdp_conf,
  $pdp_admin_host         = $argus::params::pdp_admin_host,
  $pdp_admin_password     = $argus::params::pdp_admin_password,
  $pdp_retention_interval = $argus::params::pdp_retention_interval,
  $pdp_enable_ssl         = $argus::params::pdp_enable_ssl,
  $pdp_env_file           = $argus::params::pdp_env_file,
  $pdp_jopts              = $argus::params::pdp_jopts,
  $pdp_start_jopts        = $argus::params::pdp_start_jopts,
  $pdp_home               = $argus::params::pdp_home,
  $pdp_logdir             = $argus::params::pdp_logdir,
  $pdp_libdir             = $argus::params::pdp_libdir,
  $pdp_endorseddir        = $argus::params::pdp_endorseddir,
  $pdp_provideddir        = $argus::params::pdp_provideddir,
  $pdp_pid                = $argus::params::pdp_pid,) inherits argus::params {
  require argus::commons
  require argus::pdp::install

  file {
    'pdp_conf_dir':
      ensure => directory,
      path   => $pdp_conf_dir,;

    'pdp_conf':
      ensure  => file,
      path    => $pdp_conf,
      content => template('argus/pdp.ini.erb'),;

    'pdp_env_file':
      ensure  => file,
      path    => $pdp_env_file,
      content => template('argus/argus-pdp.erb'),;
  }

  File['pdp_conf_dir'] -> File['pdp_conf']

}
