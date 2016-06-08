class os::sshd {
  if $::operatingsystem =~ /CentOS|RedHat|Scientific/ {
    $provider = 'redhat'
  }

  if $::operatingsystem =~ /Fedora/ {
    $provider = 'systemd'
  }

  package { 'openssh-server': ensure => installed }

  service { 'sshd':
    ensure   => running,
    enable   => true,
    provider => $provider,
    require  => Package['openssh-server'],
  }

  file { 'sshd_config':
    ensure  => present,
    path    => '/etc/sshd_config',
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('os/sshd_config.erb'),
    notify  => Service['sshd'],
  }
}
