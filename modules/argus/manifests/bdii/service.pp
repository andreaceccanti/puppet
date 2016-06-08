class argus::bdii::service {
  require argus::bdii::configure

  service { 'bdii':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::params::bdii_provider_script],
  }
}
