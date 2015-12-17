class intel::opencl {
	$opencl_dir = '/software/intel/opencl-1.2-3.0.67279'
	$target_dir = '/etc/alternatives'

	file {
	'/opt/intel/opencl-1.2-3.0.67279':
		ensure	=> link,
		target	=> '/software/intel/opencl-1.2-3.0.67279/';

	'intel-opencl':
		path    => '/software/modulefiles/intel-opencl',
		ensure  => present,
		content => template('intel/intel-opencl.erb');
	
	'opencl-headers':
		path	=> "$target_dir/opencl-headers",
		ensure	=> link,
		target	=> "$opencl_dir/include/CL";

	'opencl-intel-runtime':
		path    => "$target_dir/opencl-intel-runtime",
		ensure  => link,
		target  => "$opencl_dir";

	'opencl-intel-runtime-icd':
		path    => "$target_dir/opencl-intel-runtime-icd",
		ensure  => link,
		target  => "$opencl_dir/etc/intel64.icd";

	'opencl-intel-tools':
		path    => "$target_dir/opencl-intel-tools",
		ensure  => link,
		target  => "$opencl_dir";

	'opencl-intel-tools-ioc64':
		path    => "$target_dir/opencl-intel-tools-ioc64",
		ensure  => link,
		target  => "$opencl_dir/bin/ioc64";

	'opencl-intel-tools-KernelBuilder64':
		path    => "$target_dir/opencl-intel-tools-KernelBuilder64",
		ensure  => link,
		target  => "$opencl_dir/bin/KernelBuilder64";

	'opencl-libOpenCL.so':
		path    => "$target_dir/opencl-libOpenCL.so",
		ensure  => link,
		target  => "$opencl_dir/lib64/libOpenCL.so";

	'opencl-libOpenCL.so.1':
		path    => "$target_dir/opencl-libOpenCL.so.1",
		ensure  => link,
		target  => "$opencl_dir/lib64/libOpenCL.so.1";

	'opencl-libOpenCL.so.1.2':
		path    => "$target_dir/opencl-libOpenCL.so.1.2",
		ensure  => link,
		target  => "$opencl_dir/lib64/libOpenCL.so.1.2";
	}

	Mount['/software'] -> Class['intel::opencl']
}
