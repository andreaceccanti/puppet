class os_base::utilities {
  require epel;

  $packages = [
    'acpid',
    'bind-utils',
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
    'unzip',
    'xfsprogs',
    'xz',
    'vim-enhanced',
    'wget']

  package { $packages: ensure => latest,; }
}
