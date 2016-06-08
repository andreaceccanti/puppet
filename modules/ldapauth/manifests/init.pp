class ldapauth {
  if $::operatingsystem =~ /RedHat|CentOS|Scientific|Fedora/ {
    $pkg_list = ['pam_ldap', 'pam_krb5', 'nscd', 'nss-pam-ldapd']
  }

  if $::operatingsystem =~ /Debian|Ubuntu/ {
    $pkg_list = ['libpam-ldap', 'libpam-krb5', 'nscd', 'nslcd', 'auth-client-config', 'libnss-ldapd']
  }

  package { $pkg_list: ensure => latest, }

  service {
    'nslcd':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      restart   => '/etc/init.d/nslcd restart',;

    'nscd':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      restart   => '/etc/init.d/nscd restart',
      require   => Package['nscd'],;
  }

  file {
    'nsswitch.conf':
      ensure  => present,
      path    => '/etc/nsswitch.conf',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/nsswitch.conf.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;

    'pam_ldap.conf':
      ensure  => present,
      path    => '/etc/pam_ldap.conf',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/pam_ldap.conf.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;

    'krb5.conf':
      ensure  => present,
      path    => '/etc/krb5.conf',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/krb5.conf.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;

    'system-auth-ac':
      ensure  => present,
      path    => '/etc/pam.d/system-auth-ac',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/system-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;

    'sshd':
      ensure  => present,
      path    => '/etc/pam.d/sshd',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template("ldapauth/sshd_${osfamily}.erb"),
      notify  => [Service['nslcd'], Service['nscd']],;

    'password-auth-ac':
      ensure  => present,
      path    => '/etc/pam.d/password-auth-ac',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/password-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;

    'fingerprint-auth-ac':
      ensure  => present,
      path    => '/etc/pam.d/fingerprint-auth-ac',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/fingerprint-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;

    'smartcard-auth-ac':
      ensure  => present,
      path    => '/etc/pam.d/smartcard-auth-ac',
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('ldapauth/smartcard-auth-ac.erb'),
      notify  => [Service['nslcd'], Service['nscd']],;
  }
}
