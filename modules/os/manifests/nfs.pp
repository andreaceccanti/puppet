class os::nfs {
  if $::operatingsystem =~ /RedHat|CentOS|Scientific|Fedora/ {
    $pkg_list   = ['nfs-utils', 'rpcbind']
    $rpc_daemon = 'rpcbind'
  }

  if $::operatingsystem =~ /Ubuntu/ {
    $pkg_list   = ['nfs-common', 'rpcbind']
    $rpc_daemon = 'rpcbind-boot'
  }

  if $::operatingsystem =~ /Debian/ {
    $pkg_list   = ['nfs-common', 'rpcbind']
    $rpc_daemon = 'rpcbind'
  }

  package { $pkg_list: ensure => latest, }

  service { $rpc_daemon:
    ensure  => running,
    enable  => true,
    require => Package['rpcbind'],
  }
}
