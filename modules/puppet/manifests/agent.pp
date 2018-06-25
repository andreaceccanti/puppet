class puppet::agent (
  $version    = 'latest',
  $masterhost = undef) {
  #
  include puppet::repo

  package { 'puppet-agent':
    ensure  => $version,
    require => Exec['puppet-repo'],
  }

  file { 'agent_conf':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    content => template('puppet/puppet.conf.erb'),
    require => Package['puppet-agent'],
  }

  service { 'puppet':
    ensure    => running,
    enable    => true,
    subscribe => [Package['puppet-agent'], File['agent_conf']],
  }
}
