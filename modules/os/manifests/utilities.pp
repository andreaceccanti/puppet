class os::utilities {
  package {
    'redhat-lsb':
      ensure => latest,;

    'vim-enhanced':
      ensure => latest,;

    'tree':
      ensure => latest,;

    'bind-utils':
      ensure => latest,;

    'bridge-utils':
      ensure => latest,;

    'fuse-sshfs':
      ensure => latest,;

    'telnet':
      ensure => latest,;

    'tcpdump':
      ensure => latest,;

    'nmap':
      ensure => latest,;

    'sysstat':
      ensure => latest,;
  }

}
