class fetchcrl::params {
  $package_name                 = 'fetch-crl'
  $package_version              = 'latest'

  $fetchcrl_boot_service_name   = 'fetch-crl-boot'
  $fetchcrl_boot_service_ensure = 'stopped'
  $fetchcrl_boot_service_enable = true

  $fetchcrl_cron_service_name   = 'fetch-crl-cron'
  $fetchcrl_cron_service_ensure = 'running'
  $fetchcrl_cron_service_enable = true

}
