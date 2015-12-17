class os::ntp {
  $ntp_service = $::osfamily ? {
    /RedHat/ => 'ntpd',
    /Debian/ => 'ntp',
    default  => ''
  }

  package { 'ntp': ensure => latest, }

  file { "ntp.conf":
    path    => "/etc/ntp.conf",
    ensure  => present,
    require => Package['ntp'],
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "puppet:///modules/os/ntp.conf",
  }

  service { 'ntpd':
    name      => $ntp_service,
    ensure    => running,
    enable    => true,
    restart   => "service ntpd restart",
    subscribe => File['ntp.conf'],
    require   => [Package['ntp'], File['ntp.conf']];
  }

  Package['ntp'] -> File['ntp.conf'] -> Service['ntpd']
}
