class argus::pap::install {

  package { 'argus-pap':
    ensure  => installed,
    require => File['argus-repo']
  }
}
