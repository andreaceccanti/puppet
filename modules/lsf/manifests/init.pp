class lsf inherits lsf::params {
  group { $lsf::params::lsf_group:
    ensure => present,
    gid    => 500,
  } ->
  user { $lsf::params::lsf_user:
    ensure   => present,
    home     => '/home/lsfadmin',
    shell    => '/sbin/nologin',
    uid      => 500,
    gid      => 500,
    provider => useradd,
    comment  => 'LSF admin user',
  } ->
  file {
    'lsf.sh':
      ensure => present,
      path   => '/etc/profile.d/lsf.sh',
      source => 'puppet:///modules/lsf/lsf.sh',;

    '/usr/share/lsf':
      ensure => directory,
      path   => '/usr/share/lsf',

  } ->
  mount { '/usr/share/lsf':
    ensure   => mounted,
    device   => 'rd-storage:/mnt/tank/lsf',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
  }

}
