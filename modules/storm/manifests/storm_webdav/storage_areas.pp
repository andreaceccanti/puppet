class storm::storm_webdav::storage_areas {
  define sa_prop_file {
    $_storm_user  = $storm::params::user
    $_sa_conf_dir = $storm::storm_webdav::params::sa_config_dir

    File {
      owner => $_storm_user,
      group => $_storm_user,
    }

    file { "${title}-prop":
      ensure  => file,
      path    => "/${_sa_conf_dir}/${title}.properties",
      notify  => Service['storm-webdav'],
      content => template('storm/sa.properties.erb');
    }
  }

}
