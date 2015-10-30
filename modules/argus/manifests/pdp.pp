class argus::pdp {
  require argus::commons

  include argus::pdp::install
  include argus::pdp::configure
  include argus::pdp::service
}