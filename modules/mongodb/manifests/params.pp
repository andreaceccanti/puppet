class mongodb::params {
  $serverpkg = 'mongodb-server'
  $clientpkg = 'mongodb'

  $service = 'mongod'
  $user = 'mongodb'
  $group = 'mongodb'

  $conf_file = '/etc/mongodb.conf'
  $logdir = '/var/log/mongodb'
  $libdir = '/var/lib/mongodb'
}
