class storm::storm_webdav::params inherits storm::params {
  $sysconfig_file                 = '/etc/sysconfig/storm-webdav'
  $srv_keydir = '/etc/grid-security/storm-webdav'

  $jvm_opts   = '-Xms256m -Xmx512m -XX:MaxPermSize=256m -Djava.io.tmpdir=/var/lib/storm-webdav/work'
  $https_port = '8443'
  $http_port  = '8085'
  $certificate_path               = '/etc/grid-security/storm-webdav/hostcert.pem'
  $private_key_path               = '/etc/grid-security/storm-webdav/hostkey.pem'
  $trust_anchors_dir              = '/etc/grid-security/certificates'
  $trust_anchors_refresh_interval = '86400'
  $max_connections                = '300'
  $max_queue_size                 = '900'
  $connector_max_idle_time        = '30000'
  $sa_config_dir                  = '/etc/storm/webdav/sa.d'
  $jarfile    = '/usr/share/java/storm-webdav/storm-webdav-server.jar'
  $logfile    = '/var/log/storm/webdav/storm-webdav-server.log'
  $log_configuration              = '/etc/storm/webdav/logback.xml'
  $access_log_configuration       = '/etc/storm/webdav/logback-access.xml'
  $vo_map_files_enable            = false
  $vo_map_files_config_dir        = '/etc/storm/webdav/vo-mapfiles.d'
  $vo_map_files_refresh_interval  = '21600'
  $debug_opt  = 'n'
  $debug_port = '1044'
  $debug_suspend                  = 'y'
  $jvm        = '/usr/lib/jvm/java/bin/java'

  $test_vos   = {
    'dteam'             => {
      fstype         => 'posixfs',
      access_points  => '/dteam',
      vos            => 'dteam',
      auth_read      => false,
      anonymous_read => false,
    }
    ,
    'igi'               => {
      fstype         => 'posixfs',
      access_points  => '/igi',
      vos            => 'test.vo',
      auth_read      => true,
      anonymous_read => false,
    }
    ,
    'nested'            => {
      fstype         => 'posixfs',
      access_points  => '/testers.eu-emi.eu/nested,/alias',
      vos            => 'testers.eu-emi.eu',
      auth_read      => false,
      anonymous_read => false,
    }
    ,
    'noauth'            => {
      fstype         => 'posixfs',
      access_points  => '/noauth',
      vos            => 'test.vo',
      auth_read      => true,
      anonymous_read => true,
    }
    ,
    'tape'              => {
      fstype         => 'posixfs',
      access_points  => '/tape',
      vos            => 'testers.eu-emi.eu',
      auth_read      => false,
      anonymous_read => false,
    }
    ,
    'testers.eu-emi.eu' => {
      fstype         => 'posixfs',
      access_points  => '/testers.eu-emi.eu',
      vos            => 'testers.eu-emi.eu',
      auth_read      => false,
      anonymous_read => false,
    }
    ,
    'test.vo.bis'       => {
      fstype         => 'posixfs',
      access_points  => '/test.vo.bis',
      vos            => 'testers.eu-emi.eu',
      auth_read      => false,
      anonymous_read => false,
    }
    ,
    'test.vo'           => {
      fstype         => 'posixfs',
      access_points  => '/test.vo',
      vos            => 'test.vo',
      auth_read      => false,
      anonymous_read => false,
    }
    ,
  }

}
