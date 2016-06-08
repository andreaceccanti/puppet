class os::essentials {
  if $::operatingsystem =~ /RedHat|CentOS|Scientific|Fedora/ {
    $cron           = ['cronie', 'crontabs', 'cronie-anacron']
    $dns_utils      = ['bind-utils']
    $lsb            = ['redhat-lsb']
    $man_pages      = ['man-pages']
    $openssh        = ['openssh-clients']
    $vim            = ['vim-enhanced']
    $xz             = ['xz']
    $pkg_list       = ['yum-utils']

    $cron_daemon    = 'crond'
    $network_daemon = 'network'
  }

  if $::operatingsystem =~ /Debian|Ubuntu/ {
    $cron           = ['cron', 'cronutils']
    $dns_utils      = ['dnsutils']
    $lsb            = ['lsb-release']
    $man_pages      = ['manpages']
    $openssh        = ['openssh-client']
    $vim            = ['vim']
    $xz             = ['xz-utils']
    $pkg_list       = []

    $cron_daemon    = 'cron'
    $network_daemon = 'networking'
  }

  package { ['acpid', 'facter', 'openssl', 'pciutils', 'rsync', 'sysstat', 'tree', 'xfsprogs', 'wget']: ensure => latest }

  package { $cron: ensure => latest, }

  package { $dns_utils: ensure => latest, }

  package { $lsb: ensure => latest, }

  package { $man_pages: ensure => latest, }

  package { $openssh: ensure => latest, }

  package { $vim: ensure => latest, }

  package { $xz: ensure => latest, }

  package { $pkg_list: ensure => latest, }

  service {
    'acpid':
      enable => true,;

    $cron_daemon:
      ensure  => running,
      enable  => true,
      require => Package[$cron],;

    $network_daemon:
      ensure => running,
      enable => true,;
  }

}
