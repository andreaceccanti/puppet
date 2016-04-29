class argus::params {
  # common
  $conf_dir = '/etc/argus'

  $certificate_path = '/etc/grid-security/hostcert.pem '
  $private_key_path = '/etc/grid-security/hostkey.pem '

  $trust_info_dir = '/etc/grid-security/certificates'

  $pap_host = $fqdn
  $pap_port = 8150
  $pap_shutdown_port = 8151

  $pdp_host = $fqdn
  $pdp_port = 8152
  $pdp_admin_port = 8153

  $pep_host = $fqdn
  $pep_port = 8154
  $pep_admin_port = 8155

  # PAP
  $pap_conf_dir = "${conf_dir}/pap"
  $pap_admin_prop = "${pap_conf_dir}/pap-admin.properties"
  $pap_auth = "${pap_conf_dir}/pap_authorization.ini"
  $pap_conf = "${pap_conf_dir}/pap_configuration.ini"

  # PDP
  $pdp_conf_dir = "${conf_dir}/pdp"
  $pdp_conf = "${pdp_conf_dir}/pdp.ini"
  $pdp_admin_password = 'pdpadmin_password'

  # PEP
  $pep_conf_dir = "${conf_dir}/pepd"
  $pep_conf = "${pep_conf_dir}/pepd.ini"
  $pep_admin_password = 'pepdadmin_password'

  $enable_ssl = true
  $req_client_cert_auth = true

  $account_map_file = '/etc/grid-security/grid-mapfile'
  $group_map_file = '/etc/grid-security/groupmapfile'
  $grid_map_dir = '/etc/grid-security/gridmapdir'

  $voms_dir = '/etc/grid-security/vomsdir'
  $voms_map_file = '/etc/grid-security/voms-grid-mapfile'

  # BDII
  $bdii_conf_dir = "/etc/glite/info/service"
  $bdii_gip_dir = "/var/lib/bdii/gip/provider"

  $bdii_provider_script = "${bdii_gip_dir}/glite-info-glue2-provider-service-argus"
  $bdii_service_conf = "${bdii_conf_dir}/glite-info-glue2-service-argus.conf"
  $bdii_pap_conf = "${bdii_conf_dir}/glite-info-glue2-argus-pap.conf"
  $bdii_pdp_conf = "${bdii_conf_dir}/glite-info-glue2-argus-pdp.conf"
  $bdii_pep_conf = "${bdii_conf_dir}/glite-info-glue2-argus-pep.conf"
}
