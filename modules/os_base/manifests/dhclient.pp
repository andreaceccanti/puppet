class os_base::dhclient {
  $packages = ['dhclient', 'dhcp-common', 'dhcp-libs']

  package { $packages: ensure => latest,; }
}
