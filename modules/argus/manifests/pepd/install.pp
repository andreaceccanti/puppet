class argus::pepd::install {

  package { ['argus-pep-server', 'argus-pepcli']:
    ensure  => installed,
    require => Exec['argus-repo']
  }
}
