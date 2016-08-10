class zabbix::agent inherits zabbix {
  $hw_details_script = '/var/lib/zabbix/hw_full_details'

  package { $zabbix::params::pkg_agent:
    ensure  => latest,
    require => Exec['zabbix_repo'],
  }

  service { $zabbix::params::agent_srv:
    ensure  => running,
    enable  => true,
    restart => $restart_command,
    require => Package[$zabbix::params::pkg_agent],
  }

  File {
    owner   => root,
    group   => root,
    require => [Package[$zabbix::params::pkg_agent], File[$zabbix::params::zabbix_config_dir]],
    notify  => Service[$zabbix::params::agent_srv],
  }

  file {
    $zabbix::params::agent_conf_file:
      ensure  => present,
      mode    => '0644',
      content => template('zabbix/zabbix_agentd.conf.erb'),;

    $zabbix::params::zabbix_user_param_dir:
      ensure  => directory,
      source  => 'puppet:///modules/zabbix/zabbix_agentd.d',
      recurse => true,
      purge   => true,;

    $hw_details_script:
      ensure => present,
      mode   => '0755',
      owner  => $zabbix::params::zabbix_user,
      group  => $zabbix::params::zabbix_group,
      source => 'puppet:///modules/zabbix/hw_full_details',;
  }
}
