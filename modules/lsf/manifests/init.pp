class lsf {
  file {
    'lsf.sh':
      path   => '/etc/profile.d/lsf.sh',
      ensure => present,
      source => 'puppet:///modules/lsf/lsf.sh';

    '/usr/share/lsf':
      path   => '/usr/share/lsf',
      ensure => directory;
  }

  mount { '/usr/share/lsf':
    device   => 'rd-storage:/mnt/tank/lsf',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
    ensure   => mounted,
  }

  user { 'lsfadmin':
    ensure   => present,
    home     => '/home/lsfadmin',
    password => '!!',
    shell    => '/sbin/nologin',
    uid      => 500,
    gid      => 500,
    provider => useradd,
    comment  => 'LSF admin user'
  }

  group { 'lsfadmin':
    ensure => present,
    gid    => 500,
  }

  Group['lsfadmin'] -> User['lsfadmin'] -> File['/usr/share/lsf'] -> Mount['/usr/share/lsf']
}
