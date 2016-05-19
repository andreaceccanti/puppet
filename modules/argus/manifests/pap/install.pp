class argus::pap::install {
  package { 'argus-pap':
    ensure  => latest,
    require => File['argus-repo']
  }
}
