class argus::pap::service inherits argus::pap::params {
  require argus::pap::configure

  service { 'argus-pap':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::pap::params::pap_auth, $argus::pap::params::pap_conf]
  }
}