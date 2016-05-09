class argus::pdp::service {
  require argus::pdp::configure

  service { 'argus-pdp':
    ensure    => running,
    enable    => true,
    subscribe => File['pdp_conf', 'pdp_env_file']
  }
}
