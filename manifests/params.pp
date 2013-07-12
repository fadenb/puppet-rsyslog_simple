# == Class: rsyslog_simple::params
#
class rsyslog_simple::params {
  case $::osfamily {
    debian,ubuntu: {
      # packages
      $package_name       = 'rsyslog'
      $package_state      = 'latest'

      # paths/permissions
      $rsyslog_d          = '/etc/rsyslog.d/'
      $rsyslog_conf       = '/etc/rsyslog.conf'
      $rsyslog_user       = 'root'
      $rsyslog_group      = 'root'

      # service
      $service_name       = 'rsyslog'
      $service_state      = running
      $rsyslog_enable     = true

      # database
      $backend            = 'mysql'
      $dbserver           = 'localhost'
      $database           = 'rsyslog'
      $username           = 'rsyslog'
      $password           = 'insecure'
      $db_init_sql        = '/usr/share/dbconfig-common/data/rsyslog-BACKEND/install/BACKEND'

      # (remote) logging options
      $logserver          = '127.0.0.1'
      $port               = '514'
      $remote_type        = 'udp'
      $log_local          = true
      $spool_dir          = '/var/spool/rsyslog/'
      $spool_size         = '1g'

      $export_tags        = ['rsyslog', 'syslog', $::domain, ]
    }
    default: {
      fail("rsyslog_simple has no support for ${::osfamily} (yet)\nFeel free to submit a pull request :)")
    }
  }
}
