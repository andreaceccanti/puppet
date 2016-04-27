class argus::bdii::params inherits argus::params {
  $conf_dir = "/etc/glite/info/service"
  $gip_dir = "/var/lib/bdii/gip/provider"

  $provider_script = "${gip_dir}/glite-info-glue2-provider-service-argus"
  $service_conf = "${conf_dir}/glite-info-glue2-service-argus.conf"
  $pap_conf = "${conf_dir}/glite-info-glue2-argus-pap.conf"
  $pdp_conf = "${conf_dir}/glite-info-glue2-argus-pdp.conf"
  $pep_conf = "${conf_dir}/glite-info-glue2-argus-pep.conf"

}
