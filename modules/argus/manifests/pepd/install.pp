class argus::pepd::install {
  package { ['argus-pep-server', 'argus-pepcli']:
    ensure  => latest,
    require => File['argus-repo']
  }
}
