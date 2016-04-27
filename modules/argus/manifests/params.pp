class argus::params {

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
}