class argus::pdp::install {

  package { 'argus-pdp':
    ensure  => installed,
    require => File['argus-repo']
  }
}
