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
  $pap_shutdown_command = "shutdown"
  $pap_poll_interval = "300"
  $pap_ordering = "default"
  $pap_consistency_check = true
  $pap_consistency_check_repair = false

  # PDP
  $pdp_conf_dir = "${conf_dir}/pdp"
  $pdp_conf = "${pdp_conf_dir}/pdp.ini"
  $pdp_admin_password = 'pdpadmin_password'
  $pdp_retention_interval = "240"
  $pdp_enable_ssl = true

  # PEP
  $pep_conf_dir = "${conf_dir}/pepd"
  $pep_conf = "${pep_conf_dir}/pepd.ini"
  $pep_admin_password = 'pepdadmin_password'

  $pep_pips = "REQVALIDATOR_PIP OPENSSLSUBJECT_PIP GLITEXACMLPROFILE_PIP COMMONXACMLPROFILE_PIP"
  $pep_obligation_handlers = "ACCOUNTMAP_OH"

  $pep_enable_ssl = true
  $req_client_cert_auth = true

  $request_validator_pip_parser_class = "org.glite.authz.pep.pip.provider.RequestValidatorPIPIniConfigurationParser"
	$request_validator_pip_validate_request_subjects = true
	$request_validator_pip_validate_request_resources = true
	$request_validator_pip_validate_request_action = true
	$request_validator_pip_validate_request_environment = false

	$openssl_pip_parser_class = "org.glite.authz.pep.pip.provider.OpenSSLSubjectPIPIniConfigurationParser"
  $openssl_pip_subject_attribute_ids = "http://glite.org/xacml/attribute/subject-issuer urn:oasis:names:tc:xacml:1.0:subject:subject-id"
  $openssl_pip_subject_attribute_datatypes = "http://www.w3.org/2001/XMLSchema#string"

  $glite_xacml_pip_parser_class = "org.glite.authz.pep.pip.provider.AuthorizationProfilePIPIniConfigurationParser"
  $glite_xacml_pip_accepted_profile_ids = "http://glite.org/xacml/profile/grid-ce/1.0 http://glite.org/xacml/profile/grid-wn/1.0"

  $common_xacml_pip_parser_class = "org.glite.authz.pep.pip.provider.CommonXACMLAuthorizationProfilePIPIniConfigurationParser"
  $common_xacml_pip_accepted_profile_ids = "http://dci-sec.org/xacml/profile/common-authz/1.1"

  $account_map_parser_class = "org.glite.authz.pep.obligation.dfpmap.DFPMObligationHandlerConfigurationParser"
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
