class os::sudo {
  package { 'sudo': ensure => latest, }

  file { '/etc/sudoers':
    owner => 'root',
    group => 'root',
    mode  => '0440',
  }
}
