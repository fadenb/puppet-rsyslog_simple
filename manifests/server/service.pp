# == Class: rsyslog_simple::server::service
#
class rsyslog_simple::server::service (
  $service_name   = $rsyslog_simple::params::service_name,
  $service_state  = $rsyslog_simple::params::service_state,
  $service_enable = $rsyslog_simple::params::service_true,

  $rsyslog_conf   = rsyslog_simple::params::rsyslog_conf,
){
  anchor{'rsyslog_simple::server::service::begin':} ->
    service { $service_name:
      ensure    => $service_state,
      enable    => $service_enable,
      subscribe => File[$rsyslog_conf],
    }
  anchor{'rsyslog_simple::server::service:end':}
}
