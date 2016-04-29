class argus::pepd::configure (
  $pap_host = $argus::params::pap_host,
  $pap_port = $argus::params::pap_host,
  $pdp_host = $argus::params::pdp_host,
  $pdp_port = $argus::params::pdp_host,
  $pep_host = $argus::params::pep_host,
  $pep_port = $argus::params::pep_host

) inherits argus::params {

  require argus::commons
  require argus::pepd::install

  File {
    owner => root,
    group => root
  }

  file {
    'pep_conf_dir':
      path   => $argus::params::pep_conf_dir,
      ensure => directory;

    'pep_conf':
      path    => $argus::params::pep_conf,
      ensure  => file,
      content => template('argus/pepd.ini.erb');

    'account_map_file':
      path   => $argus::params::account_map_file,
      ensure => file,
      source => "puppet:///modules/argus/grid-mapfile";

    'group_map_file':
      path   => $argus::params::group_map_file,
      ensure => file,
      source => "puppet:///modules/argus/groupmapfile";

    'gridmapdir':
      path    => $argus::params::grid_map_dir,
      ensure  => directory,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/argus/gridmapdir";

    'vomsdir':
      path    => $argus::params::voms_dir,
      ensure  => directory,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/argus/vomsdir";

    'voms_map_file':
      path   => $argus::params::voms_map_file,
      ensure => file,
      source => "puppet:///modules/argus/voms-grid-mapfile"
  }

  File['pep_conf_dir'] -> File['pep_conf']
}
