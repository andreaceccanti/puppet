class argus::pepd::configure ( $pdp_host, $pdp_port ) inherits argus::pepd::params {
  require argus::commons
  require argus::pepd::install

  File {
    owner => root,
    group => root
  }

  file {
    'pep_conf_dir':
      path   => $argus::pepd::params::conf_dir,
      ensure => directory;

    'pep_conf':
      path    => $argus::pepd::params::pep_conf,
      ensure  => file,
      content => template('argus/pepd.ini.erb');

    'account_map_file':
      path   => $argus::pepd::params::account_map_file,
      ensure => file,
      source => "puppet:///modules/argus/grid-mapfile";

    'group_map_file':
      path   => $argus::pepd::params::group_map_file,
      ensure => file,
      source => "puppet:///modules/argus/groupmapfile";

    'gridmapdir':
      path    => $argus::pepd::params::grid_map_dir,
      ensure  => directory,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/argus/gridmapdir";

    'vomsdir':
      path    => $argus::pepd::params::voms_dir,
      ensure  => directory,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/argus/vomsdir";

    'voms_map_file':
      path   => $argus::pepd::params::voms_map_file,
      ensure => file,
      source => "puppet:///modules/argus/voms-grid-mapfile"
  }

  File['pep_conf_dir'] -> File['pep_conf']
}