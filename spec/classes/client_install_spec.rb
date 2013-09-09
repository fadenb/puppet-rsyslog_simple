require 'spec_helper'

describe 'rsyslog_simple::client::install' do
  it {
    should create_class('rsyslog_simple::client::install')
  }
end
