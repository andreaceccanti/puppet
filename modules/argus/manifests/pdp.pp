class argus::pdp (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_port,
  $pdp_host = $argus::params::pdp_host,
  $pdp_port = $argus::params::pdp_port

) inherits argus::params {

  require argus::commons

  class { 'argus::pdp::install': }->
  class { 'argus::pdp::configure':
    pap_host => $pap_host,
    pap_port => $pap_port,
    pdp_host => $pdp_host,
    pdp_port => $pdp_port
  }->
  class { 'argus::pdp::service': }

}
