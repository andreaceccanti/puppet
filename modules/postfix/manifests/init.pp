class postfix {
  $pkg_list = $::operatingsystem ? {
    /RedHat|CentOS|Scientific|Fedora/ => ['postfix', 'mailx'],
    /Ubuntu|Debian/ => ['postfix', 'bsd-mailx'],
    default         => '',
  }

  package { $pkg_list: ensure => latest, }

  $restart_cmd = $::operatingsystem ? {
    /Fedora/        => 'systemctl restart postfix',
    /RedHat|CentOS|Scientific|Ubuntu/ => '/etc/init.d/postfix restart',
    /Debian|Ubuntu/ => '/etc/init.d/postfix restart',
    default         => '',
  }

  service { 'postfix':
    ensure  => running,
    enable  => true,
    restart => $restart_cmd,
    require => Package['postfix'],
  }

  file { '/etc/postfix/master.cf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
