class hypervisor {
  package { 'bridge-utils': ensure => latest }

  package { 'ebtables': ensure => latest }

  package { 'libvirt': ensure => latest }

  package { 'nmap': ensure => latest }

  package { 'qemu-img': ensure => latest }

  package { 'qemu-kvm': ensure => latest }

  package { 'qemu-kvm-tools': ensure => latest }

  package { 'tcpdump': ensure => latest }

  service { 'libvirtd':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/libvirtd restart',
    require => Package['libvirt'];
  }

  file {
    'libvirtd':
      path    => '/etc/sysconfig/libvirtd',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      require => Package['libvirt'],
      content => template('hypervisor/libvirtd.erb'),
      notify  => Service['libvirtd'];

    'libvirtd.conf':
      path    => '/etc/libvirt/libvirtd.conf',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      require => Package['libvirt'],
      content => template('hypervisor/libvirtd.conf.erb'),
      notify  => Service['libvirtd'];
  }
}