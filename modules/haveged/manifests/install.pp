class haveged::install {
  require epel;

  package { 'haveged':
    ensure  => $haveged::version,
    require => Class['epel'],
  }
}
