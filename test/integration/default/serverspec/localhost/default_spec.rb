require 'serverspec'
#require 'spec_helper'
#require 'pathname'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
  end
  c.path = "/sbin:/user/sbin"
end

describe command( "echo 'hello'" ) do
  it { should return_exit_status 0 }
  it { should return_stdout 'hello' }
end

describe package('httpd') do
    it { should_not be_installed }
end

#describe service('httpd') do
#  it { should_not be_enabled }
#  it { should_not be_running }
#end

#describe port(80) do
#  it { should_not be_listening }
#end

describe file('/usr/bin/analog') do
  it { should be_file }
  it { should be_mode 755 }
end

describe command( "/usr/bin/analog 2>/dev/null | grep 'analog 6.0'" ) do
  it { should return_exit_status 0 }
end

describe package('analog') do
  it { should be_installed }
end
