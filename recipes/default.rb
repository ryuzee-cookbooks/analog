#
# Cookbook Name:: analog
# Recipe:: default 
#
# Author:: Ryuzee <ryuzee@gmail.com>
#
# Copyright 2012, Ryutaro YOSHIBA 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in wrhiting, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform]
when "centos"
  platform_version = node[:platform_version].to_f

  if platform_version >= 6.0 then
    rpmfile = "analog-6.0.4-1.x86_64.rpm"
  elsif platform_version >= 5.0 then
    rpmfile = "analog-6.0.4-1.el5.i386.rpm"
  else
    raise "This recipe can not be applied to this environment!!"
  end

  remote_file "#{Chef::Config[:file_cache_path]}/#{rpmfile}" do
    source "http://www.iddl.vt.edu/~jackie/analog/#{rpmfile}"
  end

  package "analog" do
    action :install
    source "#{Chef::Config[:file_cache_path]}/#{rpmfile}"
    provider Chef::Provider::Package::Rpm
  end
end
