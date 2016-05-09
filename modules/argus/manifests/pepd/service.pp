class argus::pepd::service {

  require argus::pepd::configure

  service { 'argus-pepd':
    ensure    => running,
    enable    => true
  }
}
