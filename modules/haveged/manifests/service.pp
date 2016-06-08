class haveged::service ($ensure = $haveged::params::service_ensure, $enable = $haveged::params::service_enable) inherits 
haveged::params {
  require haveged::install

  service { $haveged::params::service_name:
    ensure => $ensure,
    enable => $enable
  }
}
