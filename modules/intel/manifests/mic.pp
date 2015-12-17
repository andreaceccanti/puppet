class intel::mic {
  package { 'kernel': ensure => '2.6.32-358.el6' }

  file {
    'mic.sh':
      path   => '/etc/profile.d/mic.sh',
      ensure => present,
      source => 'puppet:///modules/intel/mic.sh';

    'mic-backup.cron':
      path    => '/etc/cron.daily/mic-backup.cron',
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0755',
      content => template('intel/mic-backup.cron.erb'),
      require => Mount['/mnt/backup'];
  }

  service { 'mpss':
    ensure => running,
    enable => true,
  }
}
