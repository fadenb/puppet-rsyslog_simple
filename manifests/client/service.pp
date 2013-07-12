# == Class: rsyslog_simple::client::service
#
class rsyslog_simple::client::service (
  $service_name   = $rsyslog_simple::params::service_name,
  $service_state  = $rsyslog_simple::params::service_state,
  $service_enable = $rsyslog_simple::params::service_true,

  $rsyslog_conf   = $rsyslog_simple::params::rsyslog_conf,
  $rsyslog_d      = $rsyslog_simple::params::rsyslog_d,
){
  anchor{'rsyslog_simple::client::service::begin':} ->
    service { $service_name:
      ensure    => $service_state,
      enable    => $service_enable,
      subscribe => [File[$rsyslog_conf], File["${rsyslog_d}/remote_logging.conf"], ],
    }
  anchor{'rsyslog_simple::client::service:end':}
}
