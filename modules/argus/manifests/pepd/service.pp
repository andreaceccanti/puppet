class argus::pepd::service inherits argus::pepd::params {
  require argus::pepd::configure

  service { 'argus-pepd':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::pepd::params::pep_conf]
  }
}