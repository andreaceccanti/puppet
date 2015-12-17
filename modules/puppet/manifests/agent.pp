class puppet::agent inherits puppet { 
	package { 'puppet' : 
		ensure 	=> latest,
		require => Exec['puppet-repo'],
	}

	service { "$agentname" : 
		ensure     => running, 
		provider   => "$provider",
		enable     => true, 
		require    => Package['puppet'], 
	} 

	file { 'puppet.conf':
		path    => '/etc/puppet/puppet.conf',
		ensure  => present, 
		content => template("puppet/puppet.conf.erb"),
		owner   => 'puppet', 
		group   => 'puppet', 
		require => Package['puppet'], 
		notify  => Service["$agentname"], 
	}
}
 
