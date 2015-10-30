class argus::commons inherits argus::params {
  require puppet-emi3-release

  file { $argus::params::conf_dir: ensure => directory; }
}