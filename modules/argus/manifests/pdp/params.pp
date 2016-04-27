class argus::pdp::params inherits argus::params {
  $conf_dir = '/etc/argus/pdp'
  $pdp_conf = "${conf_dir}/pdp.ini"

  $pdp_host = $fqdn
  $pdp_port = 8152
  $pdp_admin_port = 8153
  $pdp_admin_password = 'pdpadmin_password'
}