require 'spec_helper'

describe 'rsyslog_simple::client' do

  context "Debian based OS" do
    let :facts do
      {
        :osfamily => 'Debian',
        :operatingsystem => 'Debian',
        :kernel => 'Linux'
      }
    end

    it {
      should create_class('rsyslog_simple::client')
      should contain_package('rsyslog').with_ensure('latest')
      should contain_file('/etc/rsyslog.d/').with_ensure('directory')
      should contain_file('/etc/rsyslog.conf').with_ensure('file')
    }
    end
end
