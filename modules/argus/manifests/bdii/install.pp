class argus::bdii::install {
  package {
    'bdii':
      ensure => latest;

    'glite-info-provider-service':
      ensure  => installed,
      require => Exec['umd-repo'];
  }

}
