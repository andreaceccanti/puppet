class os::epel {
  if $::operatingsystem =~ /CentOS|Scientific/ {
    package { 'epel-release': ensure => latest, }
  }
}
