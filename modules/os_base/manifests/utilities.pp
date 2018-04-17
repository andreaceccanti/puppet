class os_base::utilities {
  require epel

  $packages = [
    'bind-utils',
    'conntrack-tools',
    'facter',
    'fuse-sshfs',
    'man-pages',
    'nmap',
    'openssl',
    'pciutils',
    'redhat-lsb',
    'rsync',
    'socat',
    'sysstat',
    'tcpdump',
    'telnet',
    'tree',
    'tzdata',
    'unzip',
    'xfsprogs',
    'xz',
    'vim-enhanced',
    'wget']

  package { $packages: ensure => latest,; }
}
