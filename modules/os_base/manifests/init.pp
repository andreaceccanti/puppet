class os_base {
  include epel

  include os_base::alias
  include os_base::dhclient
  include os_base::logrotate
  include os_base::motd
  include os_base::ntp
  include os_base::utilities
}
