class intel::opencl {
  $opencl_dir = '/software/intel/opencl-1.2-3.0.67279'
  $target_dir = '/etc/alternatives'

  file {
    '/opt/intel/opencl-1.2-3.0.67279':
      ensure => link,
      target => '/software/intel/opencl-1.2-3.0.67279/',;

    'intel-opencl':
      ensure  => present,
      path    => '/software/modulefiles/intel-opencl',
      content => template('intel/intel-opencl.erb'),;

    'opencl-headers':
      ensure => link,
      path   => "${target_dir}/opencl-headers",
      target => "${opencl_dir}/include/CL",;

    'opencl-intel-runtime':
      ensure => link,
      path   => "${target_dir}/opencl-intel-runtime",
      target => $opencl_dir,;

    'opencl-intel-runtime-icd':
      ensure => link,
      path   => "${target_dir}/opencl-intel-runtime-icd",
      target => "${opencl_dir}/etc/intel64.icd",;

    'opencl-intel-tools':
      ensure => link,
      path   => "${target_dir}/opencl-intel-tools",
      target => $opencl_dir,;

    'opencl-intel-tools-ioc64':
      ensure => link,
      path   => "${target_dir}/opencl-intel-tools-ioc64",
      target => "${opencl_dir}/bin/ioc64",;

    'opencl-intel-tools-KernelBuilder64':
      ensure => link,
      path   => "${target_dir}/opencl-intel-tools-KernelBuilder64",
      target => "${opencl_dir}/bin/KernelBuilder64",;

    'opencl-libOpenCL.so':
      ensure => link,
      path   => "${target_dir}/opencl-libOpenCL.so",
      target => "${opencl_dir}/lib64/libOpenCL.so",;

    'opencl-libOpenCL.so.1':
      ensure => link,
      path   => "${target_dir}/opencl-libOpenCL.so.1",
      target => "${opencl_dir}/lib64/libOpenCL.so.1",;

    'opencl-libOpenCL.so.1.2':
      ensure => link,
      path   => "${target_dir}/opencl-libOpenCL.so.1.2",
      target => "${opencl_dir}/lib64/libOpenCL.so.1.2",;
  }

  Mount['/software'] -> Class['intel::opencl']
}
