class fetchcrl (
  $package_version = $fetchcrl::params::package_version,
  $f_boot_ensure   = $fetchcrl::params::fetchcrl_boot_service_ensure,
  $f_boot_enable   = $fetchcrl::params::fetchcrl_boot_service_enable,
  $f_cron_ensure   = $fetchcrl::params::fetchcrl_cron_service_ensure,
  $f_cron_enable   = $fetchcrl::params::fetchcrl_cron_service_enable) inherits fetchcrl::params {
  class { 'fetchcrl::install': package_version => $package_version } ->
  class { 'fetchcrl::service':
    f_boot_ensure => $f_boot_ensure,
    f_boot_enable => $f_boot_enable,
    f_cron_ensure => $f_cron_ensure,
    f_cron_enable => $f_cron_enable
  }
}
