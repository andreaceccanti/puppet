class argus::pepd::service {

  require argus::pepd::configure

  service { 'argus-pepd':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::params::pep_conf]
  }
}
