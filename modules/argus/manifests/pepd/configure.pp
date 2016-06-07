class argus::pepd::configure (
  $pap_host                 = $argus::params::pap_host,
  $pap_port                 = $argus::params::pap_port,
  $pdp_host                 = $argus::params::pdp_host,
  $pdp_port                 = $argus::params::pdp_port,
  $pep_host                 = $argus::params::pep_host,
  $pep_port                 = $argus::params::pep_port,
  $pep_conf_dir             = $argus::params::pep_conf_dir,
  $pep_conf                 = $argus::params::pep_conf,
  $pep_admin_host           = $argus::params::pep_admin_host,
  $pep_admin_password       = $argus::params::pep_admin_password,
  $pep_pips                 = $argus::params::pep_pips,
  $pep_obligation_handlers  = $argus::params::pep_obligation_handlers,
  $pep_enable_ssl           = $argus::params::pep_enable_ssl,
  $req_client_cert_auth     = $argus::params::req_client_cert_auth,
  $request_validator_pip_parser_class      = $argus::params::request_validator_pip_parser_class,
  $request_validator_pip_validate_request_subjects    = $argus::params::request_validator_pip_validate_request_subjects,
  $request_validator_pip_validate_request_resources   = $argus::params::request_validator_pip_validate_request_resources,
  $request_validator_pip_validate_request_action      = $argus::params::request_validator_pip_validate_request_action,
  $request_validator_pip_validate_request_environment = $argus::params::request_validator_pip_validate_request_environment,
  $openssl_pip_parser_class = $argus::params::openssl_pip_parser_class,
  $openssl_pip_subject_attribute_ids       = $argus::params::openssl_pip_subject_attribute_ids,
  $openssl_pip_subject_attribute_datatypes = $argus::params::openssl_pip_subject_attribute_datatypes,
  $glite_xacml_pip_parser_class            = $argus::params::glite_xacml_pip_parser_class,
  $glite_xacml_pip_accepted_profile_ids    = $argus::params::glite_xacml_pip_accepted_profile_ids,
  $common_xacml_pip_parser_class           = $argus::params::common_xacml_pip_parser_class,
  $common_xacml_pip_accepted_profile_ids   = $argus::params::common_xacml_pip_accepted_profile_ids,
  $account_map_parser_class = $argus::params::account_map_parser_class,
  $account_map_file         = $argus::params::account_map_file,
  $group_map_file           = $argus::params::group_map_file,
  $grid_map_dir             = $argus::params::grid_map_dir,
  $voms_dir                 = $argus::params::voms_dir,
  $voms_map_file            = $argus::params::voms_map_file,
  $pep_env_file             = $argus::params::pep_env_file,
  $pepd_jopts               = $argus::params::pepd_jopts,
  $pepd_start_jopts         = $argus::params::pepd_start_jopts,
  $pepd_home                = $argus::params::pepd_home,
  $pepd_logdir              = $argus::params::pepd_libdir,
  $pepd_libdir              = $argus::params::pepd_libdir,
  $pepd_endorseddir         = $argus::params::pepd_endorseddir,
  $pepd_provideddir         = $argus::params::pepd_provideddir,
  $pepd_pid                 = $argus::params::pepd_pid,
  $use_secondary_group_names_for_mapping   = $argus::params::use_secondary_group_names_for_mapping,
  $prefer_dn_for_login_name = $argus::params::prefer_dn_for_login_name,
  $prefer_dn_for_primary_group_name        = $argus::params::prefer_dn_for_primary_group_name,
  $no_primary_group_name_is_error          = $argus::params::no_primary_group_name_is_error) inherits argus::params {
  require argus::commons
  require argus::pepd::install

  File {
    owner => root,
    group => root,
  }

  file {
    'pep_conf_dir':
      ensure => directory,
      path   => $pep_conf_dir;

    'pep_conf':
      ensure  => file,
      path    => $pep_conf,
      content => template('argus/pepd.ini.erb');

    'account_map_file':
      ensure => file,
      path   => $account_map_file,
      source => "puppet:///modules/argus/grid-mapfile";

    'group_map_file':
      ensure => file,
      path   => $group_map_file,
      source => "puppet:///modules/argus/groupmapfile";

    'gridmapdir':
      ensure  => directory,
      path    => $grid_map_dir,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/argus/gridmapdir";

    'vomsdir':
      ensure  => directory,
      path    => $voms_dir,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/argus/vomsdir";

    'voms_map_file':
      ensure => file,
      path   => $voms_map_file,
      source => "puppet:///modules/argus/voms-grid-mapfile";

    'pepd_env_file':
      ensure  => file,
      path    => $pep_env_file,
      content => template('argus/argus-pepd.erb');
  }

  File['pep_conf_dir'] -> File['pep_conf']
}
