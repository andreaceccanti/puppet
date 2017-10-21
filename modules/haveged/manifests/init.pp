class haveged (
  $version        = $haveged::params::version,
  $service_ensure = $haveged::params::service_ensure,
  $service_enable = $haveged::params::service_enable,) inherits haveged::params {
  #
  include epel

  class { 'haveged::install': } ~>
  class { 'haveged::service': }
}
