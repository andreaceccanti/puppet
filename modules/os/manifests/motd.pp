class os::motd {
  file { 'motd':
    ensure  => present,
    path    => '/etc/motd',
    content => template('os/motd.erb'),
  }
}
