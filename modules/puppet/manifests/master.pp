class puppet::master inherits puppet { 
	package { 'puppet-server'	: ensure => installed } 
	package { 'httpd'			: ensure => installed }
	
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
		path    => '/etc/httpd/conf.d/puppetmaster.conf',
		ensure  => present,
		source  => 'puppet:///modules/puppet/puppetmaster.conf',
		owner   => root,
		group   => root,
		mode    => 0644,
		notify  => Service['httpd'];

	'dashboard-vhost.conf':
		path    => '/etc/httpd/conf.d/dashboard-vhost.conf',
		ensure  => present,
		content => template('puppet/dashboard-vhost.conf.erb'),
		owner   => root,
		group   => root,
		mode    => 0644,
		notify  => Service['httpd'];

	'puppet-backup.cron':
		path    => '/etc/cron.daily/puppet-backup.cron',
		ensure  => present,
		content => template('puppet/puppet-backup.cron.erb'),
		owner   => root,
		group   => root,
		mode    => 0755;
	}

	mount {
	'/var/lib/puppet':
		device		=> 'rd-storage:/mnt/tank/puppet',
		fstype		=> 'nfs',
		options		=> 'defaults',
		remounts	=> false,
		atboot		=> true,
		ensure		=> mounted,
	}

	Mount['/var/lib/puppet'] -> Service['httpd']
}
