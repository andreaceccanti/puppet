class argus::bdii::install {
  package {
    'bdii':
      ensure  => latest,
      require => Package['epel-release'];

    'glite-info-provider-service':
      ensure  => installed,
      require => Exec['umd-repo'];
  }

}
