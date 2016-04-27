class argus::bdii::service inherits argus::bdii::params {
  require argus::bdii::configure

  service { 'bdii':
    ensure    => running,
    enable    => true,
    subscribe => File[$argus::bdii::params::provider_script]
  }
}
