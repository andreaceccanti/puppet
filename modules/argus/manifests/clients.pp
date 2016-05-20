class argus::clients inherits argus::commons {
  include argus::pap::install

  package { 'argus-pepcli':
    ensure  => latest,
    require => File['argus-repo'];
  }
}
