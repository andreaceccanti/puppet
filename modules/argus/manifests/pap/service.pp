class argus::pap::service  {
  require argus::pap::configure

  service { 'argus-pap':
    ensure    => running,
    enable    => true,
  }
}
