class argus::bdii::configure ($pap_host, $pap_port, $pdp_host, $pdp_port, $pep_host, $pep_port) inherits argus::bdii::params {
  require argus::commons
  require argus::bdii::install

  file {
    'gip_script':
      path    => $argus::bdii::params::provider_script,
      ensure  => present,
      owner   => ldap,
      group   => ldap,
      mode    => '0755',
      content => template('argus/glite-info-glue2-provider-service-argus.erb');

    'pap_conf':
      path    => $argus::bdii::params::pap_conf,
      ensure  => present,
      owner   => root,
      group   => root,
      content => template("argus/glite-info-glue2-argus-pap.conf.erb");

    'pdp_conf':
      path    => $argus::bdii::params::pdp_conf,
      ensure  => present,
      owner   => root,
      group   => root,
      content => template("argus/glite-info-glue2-argus-pdp.conf.erb");

    'pep_conf':
      path    => $argus::bdii::params::pep_conf,
      ensure  => present,
      owner   => root,
      group   => root,
      content => template("argus/glite-info-glue2-argus-pep.conf.erb");

    'service_conf':
      path    => $argus::bdii::params::service_conf,
      ensure  => present,
      owner   => root,
      group   => root,
      content => template("argus/glite-info-glue2-service-argus.conf.erb");
  }

}
