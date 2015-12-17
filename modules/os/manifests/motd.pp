class os::motd {
	file {'motd':
		path => '/etc/motd',
		ensure => present,
		content => template('os/motd.erb'),
	}
}
