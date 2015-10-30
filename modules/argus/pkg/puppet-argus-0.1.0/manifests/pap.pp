class argus::pap {
  require argus::commons

  include argus::pap::install
  include argus::pap::configure
  include argus::pap::service
}