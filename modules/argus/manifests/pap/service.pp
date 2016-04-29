class argus::pap::service  {
  require argus::pap::configure

  service { 'argus-pap':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::params::pap_auth, $argus::params::pap_conf]
  }
}
