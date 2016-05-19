class argus::pepd::install {
  package { 'argus-pep-server':
    ensure  => latest,
    require => File['argus-repo']
  }
}
