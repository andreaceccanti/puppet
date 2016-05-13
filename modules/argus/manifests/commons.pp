class argus::commons inherits argus::params {
  case $lsbmajdistrelease {
    6       : {
      $repo_file = "/etc/yum.repos.d/argus_el6.repo"
      $repo_file_source = "puppet:///modules/argus/argus_el6.repo"

      $umd_repo = "http://repository.egi.eu/sw/production/umd/3/sl6/x86_64/base/umd-release-3.0.0-1.el6.noarch.rpm"
      $install_umd_cmd = "yum install -y $umd_repo"
      $umd_repo_file = "/etc/yum.repos.d/UMD-3-base.repo"
    }
    7       : {
      $repo_file = "/etc/yum.repos.d/argus_el7.repo"
      $repo_file_source = "puppet:///modules/argus/argus_el7.repo"

      $umd_repo = "http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/base/umd-release-4.0.0-1.el7.noarch.rpm"
      $install_umd_cmd = "yum install -y $umd_repo"
      $umd_repo_file = "/etc/yum.repos.d/UMD-4-base.repo"

    }
    default : {
      fail("Unrecognized scientific Linux major version: $lsbmajdistrelease")
    }
  }

  Exec {
    path => "/bin:/sbin:/usr/bin:/usr/sbin" }

  exec {
    'egi-repo':
      command => 'wget https://github.com/cnaf/ci-puppet-modules/raw/master/modules/puppet-egi-trust-anchors/files/egi-trust-anchors.repo -O /etc/yum.repos.d/egi-trust-anchors.repo',
      onlyif  => "test ! -f /etc/yum.repos.d/egi-trust-anchors.repo",
      require => Package['wget'];

    'umd-repo':
      command => $install_umd_cmd,
      onlyif  => "test ! -f $umd_repo_file";
  }

  file {
    $argus::params::conf_dir:
      ensure => directory;

    $argus::params::trust_info_dir:
      ensure => directory;

    'argus-repo':
      path   => $repo_file,
      ensure => file,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => $repo_file_source;
  }

  package {
    'wget':
      ensure => present;

    'ca-policy-egi-core':
      ensure  => present,
      require => Exec['egi-repo'];
  }

}
