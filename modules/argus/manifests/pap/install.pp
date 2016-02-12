class argus::pap::install {
  package { 'argus-pap':
    ensure  => installed,
    require => Exec['argus-repo']
  }
}