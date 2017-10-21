class os_base::motd {
  file { 'motd':
    ensure  => present,
    path    => '/etc/motd',
    content => template('os_base/motd.erb'),
  }
}
