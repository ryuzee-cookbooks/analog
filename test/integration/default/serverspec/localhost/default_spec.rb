require 'spec_helper'

describe package('analog') do
  it { should be_installed }
end

describe file('/usr/bin/analog') do
  it { should be_file }
  it { should be_mode 755 }
end

describe command( "/usr/bin/analog 2>/dev/null | grep 'analog 6.0'" ) do
  its(:exit_status) { should eq 0 }
end


