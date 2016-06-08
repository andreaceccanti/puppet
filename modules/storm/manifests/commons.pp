class storm::commons {
  require puppet-emi3-release

  $_storm_user   = $storm::params::user
  $_storm_group  = $storm::params::group
  $_storage_root = $storm::params::storage_root

  package { ['fetch-crl', 'attr', 'acl']: ensure => installed, }

  user { $_storm_user:
    ensure  => present,
    gid     => $_storm_group,
    groups  => [$_storm_group],
    comment => 'StoRM Daemons',
    home    => '/home/storm',
    shell   => '/bin/bash',
  }

  group { $_storm_group: ensure => present, }

  file { $_storage_root:
    ensure => directory,
    owner  => $_storm_user,
    group  => $_storm_group,
  }

  Group[$_storm_group] -> User[$_storm_user] -> File[$_storage_root]
}

