class argus::pepd::service {
  require argus::pepd::configure

  service { 'argus-pepd':
    ensure    => running,
    enable    => true,
    subscribe => File['pep_conf', 'pepd_env_file'],
  }
}
