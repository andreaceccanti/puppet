class haveged::install ($ensure = $haveged::params::package_version) inherits haveged::params {
  package { $haveged::params::package_name: ensure => $ensure; }
}
