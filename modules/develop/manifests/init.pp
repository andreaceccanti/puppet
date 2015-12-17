class develop {
  case $::osfamily {
    'RedHat' : {
      $cmake = ['cmake', 'cmake28']
      $gcc_cpp = ['gcc-c++',]
      $git = ['git', 'hg-git']
      $glibc = ['glibc', 'glibc-devel', 'glibc-headers', 'glibc-utils', 'glibc-static']
      $libotf = ['libotf', 'libotf-devel']
      $libstdc = ['libstdc++', 'libstdc++-devel', 'libstdc++-docs']
      $openmpi = ['openmpi', 'openmpi-devel']
      $svn = ['subversion']
      $pkg_list = ['environment-modules']
    }
    'Debian' : {
      $cmake = ['cmake']
      $gcc_cpp = ['g++',]
      $git = ['git', 'mercurial-git']
      $glibc = []
      $libotf = ['libotf0', 'libotf-dev']
      $libstdc = ['libstdc++6', 'libstdc++6-4.6-dev', 'libstdc++6-4.6-doc']
      $openmpi = ['openmpi-bin', 'libopenmpi-dev']
      $svn = ['subversion']
      $pkg_list = ['build-essential']
    }
  }

  package { $pkg_list: ensure => latest }

  package { 'binutils': ensure => latest }

  package { 'byacc': ensure => latest }

  package { 'cmake': ensure => latest }

  package { 'emacs': ensure => latest }

  package { 'gcc': ensure => latest }

  package { $gcc_cpp: ensure => latest }

  package { 'gdb': ensure => latest }

  package { $git: ensure => latest }

  package { $glibc: ensure => latest }

  package { 'gnuplot': ensure => latest }

  package { 'make': ensure => latest }

  package { $libotf: ensure => latest }

  package { $libstdc: ensure => latest }

  package { $openmpi: ensure => latest }

  package { 'strace': ensure => latest }

  package { $svn: ensure => latest }

  Package[$libotf] -> Package['emacs'] -> Package[$openmpi]

  file {
    '/software':
      ensure => directory;

    '/software/modulefiles':
      ensure => directory;

    '.modulespath':
      path    => '/usr/share/Modules/init/.modulespath',
      ensure  => present,
      content => template('develop/modulespath.erb'),
      require => Package['environment-modules'];
  }

  mount { '/software':
    device   => 'rd-storage:/mnt/tank/software',
    fstype   => 'nfs',
    options  => 'defaults',
    remounts => false,
    atboot   => true,
    ensure   => mounted,
  }

  File['/software'] -> Mount['/software']
}