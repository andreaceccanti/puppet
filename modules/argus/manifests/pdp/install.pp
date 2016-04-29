class argus::pdp::install {

  package { 'argus-pdp':
    ensure  => installed,
    require => Exec['argus-repo']
  }
}
