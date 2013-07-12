# == Class: rsyslog_simple::client::config
#
class rsyslog_simple::client::config (
  $rsyslog_conf  = $rsyslog_simple::params::rsyslog_conf,
  $rsyslog_d     = $rsyslog_simple::params::rsyslog_d,
  $rsyslog_user  = $rsyslog_simple::params::rsyslog_user,
  $rsyslog_group = $rsyslog_simple::params::rsyslog_group,

  $spool_dir     = $rsyslog_simple::params::spool_dir,
  $spool_size    = $rsyslog_simple::params::spool_size,

  $logserver     = $rsyslog_simple::params::logserver,
  $port          = $rsyslog_simple::params::port,
  $remote_type   = $rsyslog_simple::params::remote_type,
  $log_local     = $rsyslog_simple::params::log_local,
){
  anchor{'rsyslog_simple::client::config::begin':}  ->
    file { $rsyslog_conf:
      ensure  => file,
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      content => template("${module_name}/rsyslog.conf.erb"),
    }                                               ->
    file { "${rsyslog_d}/remote_logging.conf":
      ensure  => file,
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      content => template("${module_name}/remote_logging.conf.erb"),
    }                                               ->
  anchor{'rsyslog_simple::client::config:end':}
}
