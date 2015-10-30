class argus::pdp::service inherits argus::pdp::params {
  require argus::pdp::configure

  service { 'argus-pdp':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::pdp::params::pdp_conf]
  }
}