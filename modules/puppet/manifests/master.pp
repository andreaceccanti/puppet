class puppet::master inherits puppet {
  package { ['puppet-server', 'httpd']: ensure => installed, }

  service { 'puppetmaster':
    ensure => stopped,
    enable => false,
  }

  service { 'httpd':
    ensure => running,
    enable => true,
  }

  file {
    'puppetmaster.conf':
      ensure => present,
      path   => '/etc/httpd/conf.d/puppetmaster.conf',
      source => 'puppet:///modules/puppet/puppetmaster.conf',
      owner  => root,
      group  => root,
      mode   => '0644',
      notify => Service['httpd'],;

    'dashboard-vhost.conf':
      ensure  => present,
      path    => '/etc/httpd/conf.d/dashboard-vhost.conf',
      content => template('puppet/dashboard-vhost.conf.erb'),
      owner   => root,
      group   => root,
      mode    => '0644',
      notify  => Service['httpd'],;

    'puppet-backup.cron':
      ensure  => present,
      path    => '/etc/cron.daily/puppet-backup.cron',
      content => template('puppet/puppet-backup.cron.erb'),
      owner   => root,
      group   => root,
      mode    => '0755',;
  }

  mount { '/var/lib/puppet':
    ensure   => mounted,
    device   => 'rd-storage:/mnt/tank/puppet',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
  }

  Mount['/var/lib/puppet'] -> Service['httpd']
}
