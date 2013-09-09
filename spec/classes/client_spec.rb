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

      it { should create_class('rsyslog_simple::client') }
    end
end
