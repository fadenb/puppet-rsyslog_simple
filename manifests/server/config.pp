# == Class: rsyslog_simple::server::config
#
class rsyslog_simple::server::config (
  $rsyslog_d     = $rsyslog_simple::params::rsyslog_d,
  $rsyslog_conf  = $rsyslog_simple::params::rsyslog_conf,
  $rsyslog_user  = $rsyslog_simple::params::rsyslog_user,
  $rsyslog_group = $rsyslog_simple::params::rsyslog_group,
){
  anchor{'rsyslog_simple::server::config::begin':}  ->
    file{ $rsyslog_d:
      ensure  => directory,
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      recurse => true,
      force   => true,
    }                                               ->
    file { $rsyslog_conf:
      ensure  => file,
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      content => template("${module_name}/rsyslog.conf.erb"),
    }                                               ->
    file { "${rsyslog_d}/server.conf":
      ensure  => file,
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      content => template("${module_name}/server.conf.erb"),
    }                                               ->
  anchor{'rsyslog_simple::server::config:end':}
}
