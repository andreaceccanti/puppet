class argus::pdp (
  $pap_host               = $argus::params::pap_host,
  $pap_port               = $argus::params::pap_port,
  $pdp_host               = $argus::params::pdp_host,
  $pdp_port               = $argus::params::pdp_port,
  $pdp_conf_dir           = $argus::params::pdp_conf_dir,
  $pdp_conf               = $argus::params::pdp_conf,
  $pdp_admin_password     = $argus::params::pdp_admin_password,
  $pdp_retention_interval = $argus::params::pdp_retention_interval,
  $pdp_enable_ssl         = $argus::params::pdp_enable_ssl

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
    pdp_admin_password     => $pdp_admin_password,
    pdp_retention_interval => $pdp_retention_interval,
    pdp_enable_ssl         => $pdp_enable_ssl
  }->
  class { 'argus::pdp::service': }

}
