class accounting {
  package { 'psacct': ensure => latest, }

  service { 'psacct':
    ensure  => running,
    enable  => true,
    require => Package['psacct'],
    restart => '/etc/init.t/psacct restart',;
  }
}
