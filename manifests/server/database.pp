# == Class: rsyslog_simple::server::database
#
class rsyslog_simple::server::database (
  $package_name  = $rsyslog_simple::params::package_name,
  $package_state = $rsyslog_simple::params::package_state,

  $rsyslog_d     = $rsyslog_simple::params::rsyslog_d,
  $rsyslog_user  = $rsyslog_simple::params::rsyslog_user,
  $rsyslog_group = $rsyslog_simple::params::rsyslog_group,

  $backend       = $rsyslog_simple::params::backend,
  $dbserver      = $rsyslog_simple::params::server,
  $database      = $rsyslog_simple::params::database,
  $username      = $rsyslog_simple::params::username,
  $password      = $rsyslog_simple::params::password,
  $db_init_sql   = $rsyslog_simple::params::db_init_sql,
){
  anchor{'rsyslog_simple::server::database::begin':}  ->
    file { "${rsyslog_d}/${backend}.conf":
      owner   => $rsyslog_user,
      group   => $rsyslog_group,
      content => template("${module_name}/backend.conf.erb"),
    }                                                 ->
    package { "${package_name}-${backend}":
      ensure => $package_state,
    }                                                 ->
    class { '::mysql::server': }                      ->
    ::mysql::db { $database:
      user     => $username,
      password => $password,
      host     => $dbserver,
      grant    => ['all'],
      #sql      => regsubst($db_init_sql, 'BACKEND', $backend),
    }                                                 ->
    # ugly exec since current mysql::db does not read credentials from  /root/.my.cnf
    exec{ "${database}-import":
      command     => regsubst("/usr/bin/mysql --defaults-file=/root/.my.cnf ${database} < ${db_init_sql}", 'BACKEND', $backend, 'G'),
      logoutput   => true,
      require     => Database_grant["${username}@${dbserver}/${database}"],
      subscribe   => Database[$database],
    }                                                 ->
  anchor{'rsyslog_simple::server::database:end':}
}
