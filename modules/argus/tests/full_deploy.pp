# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#

include puppet-infn-ca
include puppet-test-ca
include puppet-egi-trust-anchors

include argus

package {
  'fetch-crl':
    ensure => latest;

  'ca-policy-egi-core':
    ensure  => latest,
    require => Class['puppet-egi-trust-anchors'];
} ->
service {
  'fetch-crl-boot':
    enable => true,
    ensure => running;

  'fetch-crl-cron':
    enable => true,
    ensure => running;
}

