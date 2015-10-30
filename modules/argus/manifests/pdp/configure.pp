class argus::pdp::configure inherits argus::pdp::params {
  require argus::pdp::install

  file {
    'pdp_conf_dir':
      path   => $argus::pdp::params::conf_dir,
      ensure => directory;

    'pdp_conf':
      path    => $argus::pdp::params::pdp_conf,
      ensure  => file,
      content => template('argus/pdp.ini.erb');
  }

  File['pdp_conf_dir'] -> File['pdp_conf']

}