class storm::utils {
  define sa_storage_dir {
    $_storm_user = $storm::params::user
    $_storage_root = $storm::params::storage_root

    File {
      owner => $_storm_user,
      group => $_storm_user,
    }

    file { "${title}-storage-dir":
      path    => "/${_storage_root}/${title}",
      ensure  => directory,
      require => File[$_storage_root];
    }
  }
}