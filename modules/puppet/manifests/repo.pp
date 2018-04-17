class puppet::repo {
  exec { 'puppet-repo':
    command => "/usr/bin/yum install -y https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm ",
    unless  => "/usr/bin/test -f /etc/yum.repos.d/puppet5.repo",
  }
}
