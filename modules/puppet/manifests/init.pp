class puppet {
  $puppet_conf_dir = '/etc/puppet'

  case $::operatingsystem {
    'CentOS'     : {
      $repo      = 'http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm'
      $provider  = 'redhat'
      $agentname = 'puppet'
      $cmd       = "yum install -y ${repo}"
      $condition = 'test ! -f /etc/yum.repos.d/puppetlabs.repo'
    }
    'Scientific' : {
      $repo      = 'http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm'
      $provider  = 'redhat'
      $agentname = 'puppet'
      $cmd       = "yum install -y ${repo}"
      $condition = 'test ! -f /etc/yum.repos.d/puppetlabs.repo'
    }
    'Fedora'     : {
      $repo      = $::operatingsystemrelease ? {
        18      => 'https://yum.puppetlabs.com/fedora/f18/products/x86_64/puppetlabs-release-18-7.noarch.rpm',
        19      => 'https://yum.puppetlabs.com/fedora/f19/products/x86_64/puppetlabs-release-19-2.noarch.rpm',
        20      => '',
        default => ''
      }

      $repofile  = $::operatingsystemrelease ? {
        18      => '/etc/yum.repos.d/puppetlabs.repo',
        19      => '/etc/yum.repos.d/puppetlabs.repo',
        20      => '/etc/yum.repos.d/fedora.repo',
        default => ''
      }
      $provider  = 'systemd'
      $agentname = 'puppetagent'
      $cmd       = "yum install -y ${repo}"
      $condition = "test ! -f ${repofile}"
    }
    'Ubuntu'     : {
      $repo      = 'https://apt.puppetlabs.com/puppetlabs-release-precise.deb'
      $provider  = 'debian'
      $agentname = 'puppet'
      $cmd       = "wget ${repo}; dpkg -i puppetlabs-release-precise.deb"
      $condition = 'test ! -f /etc/apt/sources.list.d/puppetlabs.list'
    }
    'Debian'     : {
      $repo      = ''
      $provider  = 'debian'
      $agentname = 'puppet'
      $cmd       = 'echo'
      $condition = 'test ! -f /etc/apt/sources.list'
    }
    default      : {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

  exec { 'puppet-repo':
    command => $cmd,
    onlyif  => $condition,
  }

  package { 'ruby': ensure => latest; }
}
