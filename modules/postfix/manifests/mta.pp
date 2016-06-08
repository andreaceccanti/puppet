class postfix::mta inherits postfix {
  file { 'main.cf':
    ensure  => present,
    path    => '/etc/postfix/main.cf',
    require => Package['postfix'],
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('postfix/main.cf.mta.erb'),
    notify  => Service['postfix'],
  }
}
