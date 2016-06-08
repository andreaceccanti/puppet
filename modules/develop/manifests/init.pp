class develop {
  case $::osfamily {
    'RedHat' : {
      $cmake    = ['cmake', 'cmake28']
      $gcc_cpp  = ['gcc-c++',]
      $git      = ['git', 'hg-git']
      $glibc    = ['glibc', 'glibc-devel', 'glibc-headers', 'glibc-utils', 'glibc-static']
      $libotf   = ['libotf', 'libotf-devel']
      $libstdc  = ['libstdc++', 'libstdc++-devel', 'libstdc++-docs']
      $openmpi  = ['openmpi', 'openmpi-devel']
      $svn      = ['subversion']
      $pkg_list = ['environment-modules']
    }
    'Debian' : {
      $cmake    = ['cmake']
      $gcc_cpp  = ['g++',]
      $git      = ['git', 'mercurial-git']
      $glibc    = []
      $libotf   = ['libotf0', 'libotf-dev']
      $libstdc  = ['libstdc++6', 'libstdc++6-4.6-dev', 'libstdc++6-4.6-doc']
      $openmpi  = ['openmpi-bin', 'libopenmpi-dev']
      $svn      = ['subversion']
      $pkg_list = ['build-essential']
    }
    default  : {
      fail('Unsupported OS')
    }
  }

  package {
    $pkg_list:
      ensure => latest,;

    'binutils':
      ensure => latest,;

    'byacc':
      ensure => latest,;

    'cmake':
      ensure => latest,;

    'emacs':
      ensure => latest,;

    'gcc':
      ensure => latest,;

    $gcc_cpp:
      ensure => latest,;

    'gdb':
      ensure => latest,;

    $git:
      ensure => latest,;

    $glibc:
      ensure => latest,;

    'gnuplot':
      ensure => latest,;

    'make':
      ensure => latest,;

    $libotf:
      ensure => latest,;

    $libstdc:
      ensure => latest,;

    $openmpi:
      ensure => latest,;

    'strace':
      ensure => latest,;

    $svn:
      ensure => latest,;
  }

  Package[$libotf] -> Package['emacs'] -> Package[$openmpi]

  file {
    '/software':
      ensure => directory,;

    '/software/modulefiles':
      ensure => directory,;

    '.modulespath':
      ensure  => present,
      path    => '/usr/share/Modules/init/.modulespath',
      content => template('develop/modulespath.erb'),
      require => Package['environment-modules'],;
  }

  mount { '/software':
    ensure   => mounted,
    device   => 'rd-storage:/mnt/tank/software',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
  }

  File['/software'] -> Mount['/software']
}
