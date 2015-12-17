class dovecot {
  package { 'dovecot': ensure => installed }

  service { 'dovecot':
    enable  => true,
    ensure  => running,
    restart => '/etc/init.d/dovecot restart',
    require => Package['dovecot'],
  }

  user { 'dovecot':
    ensure  => present,
    uid     => 197,
    gid     => 'dovecot',
    home    => '/var/lib/dovecot',
    shell   => '/sbin/nologin',
    comment => 'Dovecot IMAP server',
  }

  group { 'dovecot':
    ensure => present,
    gid    => 97,
  }

  file {
    'dovecot.conf':
      path    => '/etc/dovecot/dovecot.conf',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('dovecot/dovecot.conf.erb'),
      notify  => Service['dovecot'];

    '10-mail.conf':
      path   => '/etc/dovecot/conf.d/10-mail.conf',
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/dovecot/10-mail.conf',
      notify => Service['dovecot'];

    '10-ssl.conf':
      path   => '/etc/dovecot/conf.d/10-ssl.conf',
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/dovecot/10-ssl.conf',
      notify => Service['dovecot'];

    'dovecot-backup.cron':
      path    => '/etc/cron.daily/dovecot-backup.cron',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0755',
      content => template('dovecot/dovecot-backup.cron.erb');
  }
}