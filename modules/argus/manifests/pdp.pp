class argus::pdp (
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
  $pdp_pid                = $argus::params::pdp_pid

) inherits argus::params {

  require argus::commons

  class { 'argus::pdp::install': }->
  class { 'argus::pdp::configure':
    pap_host               => $pap_host,
    pap_port               => $pap_port,
    pdp_host               => $pdp_host,
    pdp_port               => $pdp_port,
    pdp_conf_dir           => $pdp_conf_dir,
    pdp_conf               => $pdp_conf,
    pdp_admin_host         => $pdp_admin_host,
    pdp_admin_password     => $pdp_admin_password,
    pdp_retention_interval => $pdp_retention_interval,
    pdp_enable_ssl         => $pdp_enable_ssl,
    pdp_env_file           => $pdp_env_file,
    pdp_jopts              => $pdp_jopts,
    pdp_start_jopts        => $pdp_start_jopts,
    pdp_home               => $pdp_home,
		pdp_logdir             => $pdp_logdir,
		pdp_libdir             => $pdp_libdir,
		pdp_endorseddir        => $pdp_endorseddir,
		pdp_provideddir        => $pdp_provideddir,
		pdp_pid                => $pdp_pid
  }->
  class { 'argus::pdp::service': }

}
