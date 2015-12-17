class os::hosts {
  file { "/etc/hosts":
    owner   => root,
    group   => root,
    mode    => '644',
    content => template("os/hosts.erb"),
  }
}
