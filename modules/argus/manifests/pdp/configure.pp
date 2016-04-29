class argus::pdp::configure (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_host,
  $pdp_host = $argus::params::pdp_host,
  $pdp_port = $argus::params::pdp_host,

) inherits argus::params {
  require argus::commons
  require argus::pdp::install

  file {
    'pdp_conf_dir':
      path   => $argus::params::pdp_conf_dir,
      ensure => directory;

    'pdp_conf':
      path    => $argus::params::pdp_conf,
      ensure  => file,
      content => template('argus/pdp.ini.erb');
  }

  File['pdp_conf_dir'] -> File['pdp_conf']

}
