class slurm inherits slurm::params {
  include os::ntp

  package { 'munge': ensure => latest }

  service {
    'munge':
      ensure  => running,
      enable  => true,
      require => File['munge.key'];

    $slurm::params::service_name:
      ensure    => running,
      enable    => true,
      subscribe => File[$slurm::params::conf_file],
      require   => [File[$slurm::params::conf_file], Service['munge', 'ntpd']];
  }

  user { $slurm::params::slurm_user:
    ensure     => present,
    home       => '/home/slurm',
    password   => '!!',
    shell      => '/bin/false',
    uid        => $slurm::params::slurm_uid,
    gid        => $slurm::params::slurm_gid,
    managehome => false,
    comment    => 'Slurm User',
    require    => Group[$slurm::params::slurm_group],
  }

  group { $slurm::params::slurm_group:
    ensure => present,
    gid    => $slurm::params::slurm_gid,
  }

  file {
    $slurm::params::conf_dir:
      ensure  => directory,
      owner   => $slurm::params::slurm_user,
      group   => $slurm::params::slurm_group,
      mode    => '755',
      require => User[$slurm::params::slurm_user];

    $slurm::params::conf_file:
      ensure  => present,
      content => template('slurm/slurm.conf.erb'),
      require => File[$slurm::params::conf_dir];

    $slurm::params::log_dir:
      ensure  => directory,
      owner   => $slurm::params::slurm_user,
      group   => $slurm::params::slurm_group,
      mode    => '755',
      require => User[$slurm::params::slurm_user];

    $slurm::params::spool_dir:
      ensure => directory,
      owner  => $slurm::params::slurm_user,
      group  => $slurm::params::slurm_group,
      mode   => '755';

    'munge.key':
      path    => '/etc/munge/munge.key',
      ensure  => present,
      owner   => 'munge',
      group   => 'munge',
      mode    => '0400',
      source  => 'puppet:///modules/slurm/munge.key',
      require => Package['munge'];
  }

  case $::osfamily {
    'RedHat' : {
      file {
        $slurm::params::share_dir:
          ensure  => directory,
          owner   => $slurm::params::slurm_user,
          group   => $slurm::params::slurm_group,
          mode    => '755',
          require => User[$slurm::params::slurm_user];

        $slurm::params::init_script:
          ensure  => present,
          mode    => '755',
          content => template('slurm/slurm.erb'),
          require => File[$slurm::params::profile_script];

        $slurm::params::profile_script:
          ensure  => present,
          mode    => '755',
          content => template('slurm/slurm.sh.erb');

        '/etc/slurm':
          ensure  => link,
          target  => $slurm::params::conf_dir,
          require => Mount[$slurm::params::share_dir];
      }

      mount { $slurm::params::share_dir:
        device   => 'rd-storage:/mnt/tank/slurm',
        fstype   => 'nfs',
        options  => 'defaults',
        remounts => false,
        atboot   => true,
        ensure   => mounted,
        require  => File[$slurm::params::share_dir],
      }

    }
    'Debian' : {
      package { $slurm::params::pkg_name: ensure => installed }
    }

  }

  Service['munge'] -> Group[$slurm::params::slurm_group] -> User[$slurm::params::slurm_user] -> File[$slurm::params::conf_file] ->
  Service[$slurm::params::service_name]
}