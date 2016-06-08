class dovecot inherits dovecot::params {
  package { 'dovecot': ensure => installed, }

  service { 'dovecot':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/dovecot restart',
    require => Package['dovecot'],
  }

  group { $dovecot::params::dovecot_group:
    ensure => present,
    gid    => 97,
  } ->
  user { $dovecot::params::dovecot_user:
    ensure  => present,
    uid     => 197,
    gid     => 'dovecot',
    home    => '/var/lib/dovecot',
    shell   => '/sbin/nologin',
    comment => 'Dovecot IMAP server',
  }

  file {
    'dovecot.conf':
      ensure  => present,
      path    => '/etc/dovecot/dovecot.conf',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('dovecot/dovecot.conf.erb'),
      notify  => Service['dovecot'],;

    '10-mail.conf':
      ensure => present,
      path   => '/etc/dovecot/conf.d/10-mail.conf',
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/dovecot/10-mail.conf',
      notify => Service['dovecot'],;

    '10-ssl.conf':
      ensure => present,
      path   => '/etc/dovecot/conf.d/10-ssl.conf',
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/dovecot/10-ssl.conf',
      notify => Service['dovecot'],;

    'dovecot-backup.cron':
      ensure  => present,
      path    => '/etc/cron.daily/dovecot-backup.cron',
      owner   => root,
      group   => root,
      mode    => '0755',
      content => template('dovecot/dovecot-backup.cron.erb'),;
  }
}
