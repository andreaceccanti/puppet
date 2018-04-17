class puppet::master (
  $version         = '5.2.0-1.el7',
  $is_puppetmaster = true,
  $dns_alt_names   = undef,) {
  include puppet::repo

  package { 'puppetserver':
    ensure  => $version,
    require => Exec['puppet-repo'],;
  }

  file { 'master_conf':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    content => template('puppet/puppet.conf.erb'),
    mode    => '0644',
  }

  service { 'puppetserver':
    ensure    => running,
    enable    => true,
    subscribe => [Package['puppetserver'], File['master_conf']],
  }
}
