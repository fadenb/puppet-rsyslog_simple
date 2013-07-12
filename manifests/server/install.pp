# == Class: rsyslog_simple::server::install
#
class rsyslog_simple::server::install (
  $package_name  = $rsyslog_simple::params::package_name,
  $package_state = $rsyslog_simple::params::package_state,
){
  anchor{'rsyslog_simple::server::install::begin':} ->
    package{ $package_name:
      ensure => $package_state,
    }                                               ->
  anchor{'rsyslog_simple::server::install:end':}
}
