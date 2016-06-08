class os::iscsi {
  $target              = 'rd-storage'
  $initiator_name_file = '/etc/iscsi/initiatorname.iscsi'

  case $::osfamily {
    'RedHat' : {
      $initiator_pkg       = 'iscsi-initiator-utils'
      $initiator_service_d = 'iscsid'
      $lib_dir             = '/var/lib/iscsi'
    }

    'Debian' : {
      $initiator_pkg       = 'open-iscsi'
      $initiator_service_d = 'open-iscsi'
      $lib_dir             = '/var/lib/open-iscsi'
    }
  }

  package { $initiator_pkg: ensure => 'latest' }

  service { $initiator_service_d:
    ensure => running,
    enable => true,
  }

  file { $initiator_name_file:
    ensure  => present,
    content => template('os/initiatorname.iscsi.erb'),
    notify  => Service[$initiator_service_d],
  }

  exec { 'iscsi_discovery':
    command => "iscsiadm -m discovery -t st -p ${target}",
    creates => "${lib_dir}/send_targets/${target},3260/st_config",
    returns => [0, 21]
  }

  Package[$initiator_pkg] -> File[$initiator_name_file] -> Exec['iscsi_discovery'] -> Service[
    $initiator_service_d]
}
