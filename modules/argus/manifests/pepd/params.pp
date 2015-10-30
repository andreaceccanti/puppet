class argus::pepd::params inherits argus::params {
  $conf_dir = '/etc/argus/pepd'
  $pep_conf = "${conf_dir}/pepd.ini"

  $pep_host = $fqdn
  $pep_port = 8154
  $pep_admin_port = 8155
  $pep_admin_password = 'pepdadmin_password'

  $enable_ssl = true
  $req_client_cert_auth = true

  $account_map_file = '/etc/grid-security/grid-mapfile'
  $group_map_file = '/etc/grid-security/groupmapfile'
  $grid_map_dir = '/etc/grid-security/gridmapdir'

}