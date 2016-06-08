class nvidia::cuda {
  file {
    'cuda.sh':
      ensure => present,
      path   => '/etc/profile.d/cuda.sh',
      source => 'puppet:///modules/nvidia/cuda.sh',;

    'cuda':
      ensure => link,
      path   => '/usr/local/cuda',
      target => '/opt/cuda-5.0',;
  }
}
