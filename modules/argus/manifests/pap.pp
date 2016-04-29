class argus::pap (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_port

) inherits argus::params {

  require argus::commons

  class { 'argus::pap::install': }->
  class { 'argus::pap::configure':
    pap_host => $pap_host,
    pap_port => $pap_port
  }->
  class { 'argus::pap::service': }
}
