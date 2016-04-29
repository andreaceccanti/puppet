class argus::pdp::service {
  require argus::pdp::configure

  service { 'argus-pdp':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::params::pdp_conf]
  }
}
