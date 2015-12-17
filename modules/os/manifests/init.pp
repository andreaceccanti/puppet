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
    path   => '/mnt/backup',
    ensure => directory;
  }

  mount { '/mnt/backup':
    device   => 'rd-storage:/mnt/tank/backup',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
    ensure   => mounted,
  }

  File['backup'] -> Mount['/mnt/backup']

}