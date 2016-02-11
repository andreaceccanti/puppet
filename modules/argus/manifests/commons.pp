class argus::commons inherits argus::params {
  case $lsbmajdistrelease {
    5       : {
      $release_package = "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl5/x86_64/base/emi-release-3.0.0-2.el5.noarch.rpm"
      $install_repo_cmd = "yum install -y $release_package"
    }
    6       : {
      $release_package = "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/x86_64/base/emi-release-3.0.0-2.el6.noarch.rpm"
      $install_repo_cmd = "yum install -y $release_package"
    }
    7       : {
      $release_package = "https://github.com/argus-authz/repo/raw/gh-pages/yum/argus-beta-el7.repo"
      $install_repo_cmd = "wget -O /etc/yum.repos.d/argus_el7.repo $release_package"
    }
    default : {
      fail("Unrecognized scientific linux major version: $lsbmajdistrelease")
    }
  }

  Exec {
    path => "/bin:/sbin:/usr/bin:/usr/sbin" }

  exec {
    'egi-repo':
      command => 'wget https://github.com/cnaf/ci-puppet-modules/raw/master/modules/puppet-egi-trust-anchors/files/egi-trust-anchors.repo -O /etc/yum.repos.d/egi-trust-anchors.repo',
      onlyif  => "test ! -f /etc/yum.repos.d/egi-trust-anchors.repo",
      require => Package['wget'];

    'test-ca':
      command => 'wget http://radiohead.cnaf.infn.it:9999/view/All/job/repo_test_ca/lastSuccessfulBuild/artifact/test-ca.repo -O /etc/yum.repos.d/test-ca.repo',
      onlyif  => "test ! -f /etc/yum.repos.d/test-ca.repo",
      require => Package['wget'];
  }

  file {
    $argus::params::conf_dir:
      ensure => directory;

    $argus::params::trust_info_dir:
      ensure => directory;
  }

  package {
    'wget':
      ensure => present;

    'ca_INFN-CA*':
      ensure  => present,
      require => Exec['egi-repo'];

    'ca-policy-egi-core':
      ensure  => present,
      require => Exec['egi-repo'];

    'igi-test-ca*':
      ensure  => present,
      require => Exec['test-ca'];
  }
}
