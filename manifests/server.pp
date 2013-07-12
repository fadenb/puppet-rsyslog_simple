# == Class: rsyslog_simple::server
#
class rsyslog_simple::server (
  $package_name   = $rsyslog_simple::params::package_name,
  $package_state  = $rsyslog_simple::params::package_state,

  $rsyslog_d      = $rsyslog_simple::params::rsyslog_d,
  $rsyslog_conf   = $rsyslog_simple::params::rsyslog_conf,
  $rsyslog_user   = $rsyslog_simple::params::rsyslog_user,
  $rsyslog_group  = $rsyslog_simple::params::rsyslog_group,

  $service_name   = $rsyslog_simple::params::service_name,
  $service_state  = $rsyslog_simple::params::service_state,
  $service_enable = $rsyslog_simple::params::service_true,

  $backend        = $rsyslog_simple::params::backend,
  $dbserver       = $rsyslog_simple::params::dbserver,
  $database       = $rsyslog_simple::params::database,
  $username       = $rsyslog_simple::params::username,
  $password       = $rsyslog_simple::params::password,

) inherits params {
  anchor{'rsyslog_simple::server::begin':}      ->
    notify{"fnord: ${rsyslog_d}":}              ->
    class {'rsyslog_simple::server::install':
      package_name  => $package_name,
      package_state => $package_state,

      rsyslog_d     => $rsyslog_d,
      rsyslog_user  => $rsyslog_user,
      rsyslog_group => $rsyslog_group,
    }  ->
    class {'rsyslog_simple::server::config':
      rsyslog_conf  => $rsyslog_conf,
      rsyslog_user  => $rsyslog_user,
      rsyslog_group => $rsyslog_group,
    }                                           ->
    class {'rsyslog_simple::server::database':
      rsyslog_user  => $rsyslog_user,
      rsyslog_group => $rsyslog_group,

      backend       => $backend,
      dbserver      => $dbserver,
      database      => $database,
      username      => $username,
      password      => $password,
    }                                           ->
    class {'rsyslog_simple::server::service':
      service_name   => $service_name,
      service_state  => $service_state,
      service_enable => $service_enable,
      rsyslog_conf   => $rsyslog_conf,
    }                                           ->
  anchor{'rsyslog_simple::server::end':}

  # export a minimally preconfigured client
  @@rsyslog_simple::exported_client { "syslog client exported from ${::fqdn}":
    logserver => $::fqdn,
    tag       => "rsyslog_client-${::domain}",
  }
}
