class fetchcrl::service (
  $f_boot_ensure = $fetchcrl::params::fetchcrl_boot_service_ensure,
  $f_boot_enable = $fetchcrl::params::fetchcrl_boot_service_enable,
  $f_cron_ensure = $fetchcrl::params::fetchcrl_cron_service_ensure,
  $f_cron_enable = $fetchcrl::params::fetchcrl_cron_service_enable) inherits fetchcrl::params {
  require fetchcrl::install

  service {
    $fetchcrl::params::fetchcrl_boot_service_name:
      ensure => $f_boot_ensure,
      enable => $f_boot_enable;

    $fetchcrl::params::fetchcrl_cron_service_name:
      ensure => $f_boot_ensure,
      enable => $f_boot_enable;
  }

}
