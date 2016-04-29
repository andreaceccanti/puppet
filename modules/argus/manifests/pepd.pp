class argus::pepd (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_port,
  $pdp_host = $argus::params::pdp_host,
  $pdp_port = $argus::params::pdp_port,
  $pep_host = $argus::params::pep_host,
  $pep_port = $argus::params::pep_port

) inherits argus::params {

  require argus::commons

  class { 'argus::pepd::install': }->
  class { 'argus::pepd::configure':
    pap_host => $pap_host,
    pap_port => $pap_port,
    pdp_host => $pdp_host,
    pdp_port => $pdp_port,
    pep_host => $pep_host,
    pep_port => $pep_port
  }->
  class { 'argus::pepd::service': }

}
