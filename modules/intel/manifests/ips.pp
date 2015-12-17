class intel::ips {
	file {	
#	'linux-k1om-4.7':
#		path    => '/usr/linux-k1om-4.7',
#		ensure  => link,
#		target  => '/software/linux-k1om-4.7/',
#		require	=> Mount['/software'];
	
	'ips-xe-2013':
		path	=> '/software/modulefiles/ips-xe-2013',
		ensure	=> present,
		content	=> template('intel/ips-xe-2013.erb'),
		require => Mount['/software'];
	}
}
