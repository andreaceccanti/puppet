class zabbix inherits zabbix::params {
  exec { 'zabbix_repo':
    command => $zabbix::params::install_repo_command,
    onlyif  => "test ! -f ${zabbix::params::repofile}",
  } ->
  group { $zabbix::params::zabbix_group: ensure => 'present', } ->
  user { $zabbix::params::zabbix_user:
    ensure     => 'present',
    home       => $zabbix::params::zabbix_user_home_dir,
    shell      => '/bin/bash',
    gid        => 'zabbix',
    managehome => true,
    comment    => 'Zabbix Monitoring System',
    require    => Group['zabbix'],
  } ->
  file {
    $zabbix::params::zabbix_config_dir:
      ensure => directory,
      owner  => root,
      group  => root,
      mode   => '0755';

    $zabbix::params::zabbix_log_dir:
      ensure => directory,
      owner  => $zabbix::params::zabbix_user,
      group  => $zabbix::params::zabbix_group,
      mode   => '0755',;

    $zabbix::params::zabbix_pid_dir:
      ensure => directory,
      owner  => $zabbix::params::zabbix_user,
      group  => $zabbix::params::zabbix_group,
      mode   => '0755',;

    $zabbix::params::zabbix_user_home_dir:
      ensure => directory,
      owner  => $zabbix::params::zabbix_user,
      group  => $zabbix::params::zabbix_group,
      mode   => '0700',;
  }

}
