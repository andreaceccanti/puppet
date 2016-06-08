class fetchcrl::install ($package_version = $fetchcrl::params::package_version) inherits fetchcrl::params {
  package { $fetchcrl::params::package_name: ensure => $package_version }
}
