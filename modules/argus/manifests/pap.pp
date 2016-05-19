class argus::pap (
  $pap_host       = $argus::params::pap_host,
  $pap_port       = $argus::params::pap_port,
  $pap_conf_dir   = $argus::params::pap_conf_dir,
  $pap_admin_prop = $argus::params::pap_admin_prop,
  $pap_auth       = $argus::params::pap_auth,
  $pap_conf       = $argus::params::pap_conf,
  $pap_shutdown_command         = $argus::params::pap_shutdown_port,
  $pap_poll_interval            = $argus::params::pap_poll_interval,
  $pap_ordering   = $argus::params::pap_ordering,
  $pap_consistency_check        = $argus::params::pap_consistency_check,
  $pap_consistency_check_repair = $argus::params::pap_consistency_check_repair,
  $pap_env_file   = $argus::params::pap_env_file,
  $pap_home       = $argus::params::pap_home,
  $pap_pid        = $argus::params::pap_pid,
  $pap_java_opts  = $argus::params::pap_java_opts) inherits argus::params {
  require argus::commons

  class { 'argus::pap::install': } ->
  class { 'argus::pap::configure':
    pap_host       => $pap_host,
    pap_port       => $pap_port,
    pap_conf_dir   => $pap_conf_dir,
    pap_admin_prop => $pap_admin_prop,
    pap_auth       => $pap_auth,
    pap_conf       => $pap_conf,
    pap_shutdown_command         => $pap_shutdown_port,
    pap_poll_interval            => $pap_poll_interval,
    pap_ordering   => $pap_ordering,
    pap_consistency_check        => $pap_consistency_check,
    pap_consistency_check_repair => $pap_consistency_check_repair,
    pap_env_file   => $pap_env_file,
    pap_home       => $pap_home,
    pap_pid        => $pap_pid,
    pap_java_opts  => $pap_java_opts
  } ->
  class { 'argus::pap::service': }
}
