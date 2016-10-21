class os::ntp {
  $ntp_service = $::osfamily ? {
    /RedHat/ => 'ntpd',
    /Debian/ => 'ntp',
    default  => '',
  }

  package { 'ntp': ensure => latest, }

  file { 'ntp.conf':
    ensure  => present,
    path    => '/etc/ntp.conf',
    require => Package['ntp'],
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/os/ntp.conf',
  }

  service { 'ntpd':
    ensure    => running,
    name      => $ntp_service,
    enable    => true,
    subscribe => File['ntp.conf'],
    require   => [Package['ntp'], File['ntp.conf']],
  }

  Package['ntp'] -> File['ntp.conf'] -> Service['ntpd']
}
