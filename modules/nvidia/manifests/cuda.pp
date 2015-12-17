class nvidia::cuda {
	file { 
	'cuda.sh':
		path    => '/etc/profile.d/cuda.sh',
		ensure  => present,
		source  => 'puppet:///modules/nvidia/cuda.sh';

	'cuda':
		path    => '/usr/local/cuda',
		ensure  => link,
		target  => '/opt/cuda-5.0';
	}
}
