class os::epel {
  if $::operatingsystem =~ /CentOS|Scientific/ {
    package { 'epel-release':
      ensure => latest,
      source => 'http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
    }
  }
}
