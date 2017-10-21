class haveged::service {
  require haveged::install

  service { 'haveged':
    ensure => $haveged::service_ensure,
    enable => $haveged::service_enable,
  }
}
