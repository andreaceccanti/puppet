class argus::bdii::configure (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_host,
  $pdp_host = $argus::params::pdp_host,
  $pdp_port = $argus::params::pdp_host,
  $pep_host = $argus::params::pep_host,
  $pep_port = $argus::params::pep_host,) inherits argus::params {
  require argus::commons
  require argus::bdii::install

  file {
    'gip_script':
      ensure  => present,
      path    => $argus::params::bdii_provider_script,
      owner   => ldap,
      group   => ldap,
      mode    => '0755',
      content => template('argus/glite-info-glue2-provider-service-argus.erb'),;

    'bdii_pap_conf':
      ensure  => present,
      path    => $argus::params::bdii_pap_conf,
      owner   => root,
      group   => root,
      content => template('argus/glite-info-glue2-argus-pap.conf.erb'),;

    'bdii_pdp_conf':
      ensure  => present,
      path    => $argus::params::bdii_pdp_conf,
      owner   => root,
      group   => root,
      content => template('argus/glite-info-glue2-argus-pdp.conf.erb'),;

    'bdii_pep_conf':
      ensure  => present,
      path    => $argus::params::bdii_pep_conf,
      owner   => root,
      group   => root,
      content => template('argus/glite-info-glue2-argus-pep.conf.erb'),;

    'bdii_service_conf':
      ensure  => present,
      path    => $argus::params::bdii_service_conf,
      owner   => root,
      group   => root,
      content => template('argus/glite-info-glue2-service-argus.conf.erb'),;
  }

}
