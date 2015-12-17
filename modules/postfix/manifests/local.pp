class postfix::local inherits postfix {
  file { 'main.cf':
    path    => '/etc/postfix/main.cf',
    ensure  => present,
    require => Package['postfix'],
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('postfix/main.cf.local.erb'),
    notify  => Service['postfix'],
  }
}
