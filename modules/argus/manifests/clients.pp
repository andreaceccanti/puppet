class argus::clients {
  package {
    'argus-pap':
      ensure  => latest,
      require => File['argus-repo'];

    'argus-pepcli':
      ensure  => latest,
      require => File['argus-repo'];
  }
}
