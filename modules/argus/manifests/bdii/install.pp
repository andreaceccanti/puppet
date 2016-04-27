class argus::bdii::install {
  package {
    'bdii':
      ensure => installed;

    'glite-info-provider-service':
      ensure  => installed,
      require => Exec['umd-repo'];
  }

}
