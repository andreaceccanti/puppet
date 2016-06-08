class hypervisor {
  package { ['bridge-utils', 'ebtables', 'libvirt', 'nmap', 'qemu-img', 'qemu-kvm', 'qemu-kvm-tools', 'tcpdump']: ensure => latest, }

  service { 'libvirtd':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/libvirtd restart',
    require => Package['libvirt'],
  }

  file {
    'libvirtd':
      ensure  => present,
      path    => '/etc/sysconfig/libvirtd',
      owner   => root,
      group   => root,
      mode    => '0644',
      require => Package['libvirt'],
      content => template('hypervisor/libvirtd.erb'),
      notify  => Service['libvirtd'],;

    'libvirtd.conf':
      ensure  => present,
      path    => '/etc/libvirt/libvirtd.conf',
      owner   => root,
      group   => root,
      mode    => '0644',
      require => Package['libvirt'],
      content => template('hypervisor/libvirtd.conf.erb'),
      notify  => Service['libvirtd'],;
  }
}
