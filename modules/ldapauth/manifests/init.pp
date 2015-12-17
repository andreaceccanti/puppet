class ldapauth {
  if $::operatingsystem =~ /RedHat|CentOS|Scientific|Fedora/ {
    $pkg_list = ['pam_ldap', 'pam_krb5', 'nscd', 'nss-pam-ldapd']
  }

  if $::operatingsystem =~ /Debian|Ubuntu/ {
    $pkg_list = ['libpam-ldap', 'libpam-krb5', 'nscd', 'nslcd', 'auth-client-config', 'libnss-ldapd']
  }

  package { $pkg_list: ensure => latest }

  service {
    'nslcd':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      restart   => '/etc/init.d/nslcd restart';

    'nscd':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      restart   => '/etc/init.d/nscd restart',
      require   => Package['nscd'];
  }

  file {
    'nsswitch.conf':
      path    => '/etc/nsswitch.conf',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/nsswitch.conf.erb'),
      notify  => [Service['nslcd'], Service['nscd']];

    'pam_ldap.conf':
      path    => '/etc/pam_ldap.conf',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/pam_ldap.conf.erb'),
      notify  => [Service['nslcd'], Service['nscd']];

    'krb5.conf':
      path    => '/etc/krb5.conf',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/krb5.conf.erb'),
      notify  => [Service['nslcd'], Service['nscd']];

    'system-auth-ac':
      path    => '/etc/pam.d/system-auth-ac',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/system-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']];

    'sshd':
      path    => '/etc/pam.d/sshd',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template("ldapauth/sshd_$osfamily.erb"),
      notify  => [Service['nslcd'], Service['nscd']];

    'password-auth-ac':
      path    => '/etc/pam.d/password-auth-ac',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/password-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']];

    'fingerprint-auth-ac':
      path    => '/etc/pam.d/fingerprint-auth-ac',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/fingerprint-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']];

    'smartcard-auth-ac':
      path    => '/etc/pam.d/smartcard-auth-ac',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/smartcard-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']];
  }
}