class intel::ips {
  file { 'ips-xe-2013':
    ensure  => present,
    path    => '/software/modulefiles/ips-xe-2013',
    content => template('intel/ips-xe-2013.erb'),
    require => Mount['/software'],
  }
}
