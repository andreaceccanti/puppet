class rsyslog::params {
  $pkgname = 'rsyslog'
  $mongo_module = 'rsyslog-mongodb'
  $json_module = 'rsyslog-mmjsonparse'
  $service_name = 'rsyslog'
  $conf_file = '/etc/rsyslog.conf'
  $module_conf = '/etc/rsyslog.d/ommongodb.conf'
  $sender_conf = '/etc/rsyslog.d/syslog-sender.conf'

  $restart_cmd = $::operatingsystem ? {
    /Fedora/                   => 'systemctl restart rsyslog',
    /RedHat|CentOS|Scientific/ => '/etc/init.d/rsyslog restart',
    /Ubuntu|Debian/            => '/etc/init.d/rsyslog restart',
    default                    => '',
  }

  case $::osfamily {
    'RedHat' : {
      $repofile = '/etc/yum.repos.d/rsyslog.repo'
      $repotmpl = 'rsyslog/rsyslog.repo.erb'

      $version = $::operatingsystem ? {
        /Fedora/            => "7.2.6-1.fc${::operatingsystemrelease}",
        /CentOS|Scientific/ => '7.2.6-4.el6',
        default             => '',
      }

      $downgrade_command = "yum downgrade -y ${pkgname}-${version} ${mongo_module}-${version} ${json_module}-${version}; ${restart_cmd} "
      $downgrade_test = "test `rpm -q ${pkgname}` != ${pkgname}-${version}.${::hardwaremodel}"
    }
    'Debian' : {
      $repofile = '/etc/apt/sources.list.d/rsyslog.list'
      $repotmpl = 'rsyslog/rsyslog.list.erb'

      $downgrade_command = 'echo'
      $downgrade_test = 'test 0 -eq 1'
    }
  }

  $db_host = 'rd-logserver.cnaf.infn.it'
  $db_name = 'syslog'
  $table_name = 'log'
  $db_user = 'syslog'
  $db_pwd = 'syslog'
}
