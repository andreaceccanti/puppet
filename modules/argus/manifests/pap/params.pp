class argus::pap::params inherits argus::params {
  $conf_dir = '/etc/argus/pap'
  $pap_admin_prop = "${conf_dir}/pap-admin.properties"
  $pap_auth = "${conf_dir}/pap_authorization.ini"
  $pap_conf = "${conf_dir}/pap_configuration.ini"

  $pap_host = $fqdn
  $pap_port = 8150
  $pap_shutdown_port = 8151
}