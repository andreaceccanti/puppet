# == Class: storm-webdav
#
# Module to configure StoRM webdav service.
#
# === Parameters
#
# Document parameters here.
#
# [*vo_list*]
#   List of VOs to enable.
#
# === Examples
#
#  class { 'storm-webdav':
#    vo_list => [ 'vo1', vo2' ],
#  }
#
# === Authors
#
# Marco Caberletti <marco.caberletti@cnaf.infn.it>
#
class storm::storm_webdav ($vo_list = []) inherits storm::storm_webdav::params {
  require storm::commons

  $_storm_user = $storm::params::user

  package { 'storm-webdav': ensure => installed; }

  service { 'storm-webdav':
    ensure     => running,
    enable     => true,
    hasrestart => false
  }

  file {
    'sysconf':
      path    => $storm::storm_webdav::params::sysconfig_file,
      ensure  => file,
      content => template("storm/storm-webdav.erb"),
      notify  => Service['storm-webdav'];

    'keydir':
      path   => $storm::storm_webdav::params::srv_keydir,
      ensure => directory,
      owner  => $_storm_user,
      group  => $_storm_user;

    'cert_pub':
      path   => $storm::storm_webdav::params::certificate_path,
      ensure => file,
      owner  => $_storm_user,
      group  => $_storm_user,
      source => "/etc/grid-security/hostcert.pem";

    'priv_key':
      path   => $storm::storm_webdav::params::private_key_path,
      ensure => file,
      owner  => $_storm_user,
      group  => $_storm_user,
      source => "/etc/grid-security/hostkey.pem";
  }

  storm::storm_webdav::storage_areas::sa_prop_file { $vo_list: }

  storm::utils::sa_storage_dir { $vo_list: }

  Package['storm-webdav'] -> File['sysconf'] -> File['keydir'] -> File['cert_pub'] -> File['priv_key'] -> Service['storm-webdav']

}