class zabbix inherits zabbix::params {
  exec { 'zabbix_repo':
    command => $zabbix::params::install_repo_command,
    onlyif  => "test ! -f $zabbix::params::repofile",
  }

  file {
    $zabbix::params::zabbix_config_dir:
      ensure => directory,
      owner  => root,
      group  => root,
      mode   => "755";

    $zabbix::params::zabbix_log_dir:
      ensure  => directory,
      owner   => zabbix,
      group   => zabbix,
      mode    => "755",
      require => User['zabbix'];

    $zabbix::params::zabbix_pid_dir:
      ensure  => directory,
      owner   => zabbix,
      group   => zabbix,
      mode    => "755",
      require => User['zabbix'];

    $zabbix::params::zabbix_user_home_dir:
      ensure  => directory,
      owner   => zabbix,
      group   => zabbix,
      mode    => "700",
      require => User['zabbix'];
  }

  user { 'zabbix':
    ensure     => 'present',
    home       => $zabbix::params::zabbix_user_home_dir,
    password   => '!!',
    shell      => '/bin/bash',
    gid        => 'zabbix',
    managehome => true,
    comment    => 'Zabbix Monitoring System',
    require    => Group['zabbix'],
  }

  group { 'zabbix': ensure => 'present', }

  Exec['zabbix_repo'] -> Group['zabbix'] -> User['zabbix']
}
