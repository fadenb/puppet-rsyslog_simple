# == Class: rsyslog_simple::client::install
#
class rsyslog_simple::client::install (
  $package_name  = $rsyslog_simple::params::package_name,
  $package_state = $rsyslog_simple::params::package_state,

  $rsyslog_d     = $rsyslog_simple::params::rsyslog_d,
  $rsyslog_user  = $rsyslog_simple::params::rsyslog_user,
  $rsyslog_group = $rsyslog_simple::params::rsyslog_group,
){
  anchor{'rsyslog_simple::client::install::begin':} ->
    package{ $package_name:
      ensure => $package_state,
    }                                               ->

    # On Debian the rsyslog.d directory will be created by the package
    # this is currently just prepping for other systems
    file{ $rsyslog_d:
      ensure  => directory,
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      recurse => true,
      force   => true,
    }                                               ->
  anchor{'rsyslog_simple::client::install:end':}
}
