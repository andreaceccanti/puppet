# == Class: storm::params
#
# StoRM common parameters.
#
# === Authors
#
# Marco Caberletti <marco.caberletti@cnaf.infn.it>
#

class storm::params {
  $storage_root = '/storage'
  $user = 'storm'
  $group = 'storm'

}
