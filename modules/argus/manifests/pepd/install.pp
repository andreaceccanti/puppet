class argus::pepd::install {
  package {
    'argus-pep-server':
      ensure => installed;

    'argus-pepcli':
      ensure => installed;
  }
}