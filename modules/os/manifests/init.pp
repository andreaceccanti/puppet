class os {
  include os::bashrc
  include os::epel
  include os::essentials
  include os::iscsi
  include os::logrotate
  include os::motd
  include os::nfs
  include os::ntp
  include os::sudo

  if $::operatingsystem =~ /RedHat|CentOS|Scientific|Fedora/ {
    include os::yum_update
  }

  file { 'backup':
    ensure => directory,
    path   => '/mnt/backup',
  }

  mount { '/mnt/backup':
    ensure   => mounted,
    device   => 'rd-storage:/mnt/tank/backup',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
  }

  File['backup'] -> Mount['/mnt/backup']
}
