# == Define: rsyslog_simple::exported_client
#
define rsyslog_simple::exported_client (
  $package_name   = $rsyslog_simple::params::package_name,
  $package_state  = $rsyslog_simple::params::package_state,

  $rsyslog_d      = $rsyslog_simple::params::rsyslog_d,
  $rsyslog_conf   = $rsyslog_simple::params::rsyslog_conf,
  $rsyslog_user   = $rsyslog_simple::params::rsyslog_user,
  $rsyslog_group  = $rsyslog_simple::params::rsyslog_group,

  $service_name   = $rsyslog_simple::params::service_name,
  $service_state  = $rsyslog_simple::params::service_state,
  $service_enable = $rsyslog_simple::params::service_true,

  $spool_dir      = $rsyslog_simple::params::spool_dir,
  $spool_size     = $rsyslog_simple::params::spool_size,

  $logserver      = $rsyslog_simple::params::logserver,
  $port           = $rsyslog_simple::params::port,
  $remote_type    = $rsyslog_simple::params::remote_type,
  $log_local      = $rsyslog_simple::params::log_local,
) {
    class {'rsyslog_simple::client':
      package_name   => $package_name,
      package_state  => $package_state,
      rsyslog_d      => $rsyslog_d,
      rsyslog_user   => $rsyslog_user,
      rsyslog_group  => $rsyslog_group,
      rsyslog_conf   => $rsyslog_conf,
      spool_dir      => $spool_dir,
      spool_size     => $spool_size,
      logserver      => $logserver,
      port           => $port,
      remote_type    => $remote_type,
      log_local      => $log_local,
      service_name   => $service_name,
      service_state  => $service_state,
      service_enable => $service_enable,
    }
}
