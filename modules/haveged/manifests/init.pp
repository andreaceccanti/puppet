class haveged (
  $package_version = $haveged::params::package_version,
  $service_ensure  = $haveged::params::service_ensure,
  $service_enable  = $haveged::params::service_enable,) inherits haveged::params {
  class { 'haveged::install': ensure => $package_version, } ->
  class { 'haveged::service':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
