class argus::pepd {
  require argus::commons

  include argus::pepd::install
  include argus::pepd::configure
  include argus::pepd::service
}