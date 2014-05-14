#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, Atalanta Systems Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "selinux::disabled"

class ::Chef::Recipe
  include ::Opscode::ChefClient::Helpers
end

unless chef_server?
  file Chef::Config[:validation_key] do
    action :delete
    backup false
    only_if { ::File.exists?(Chef::Config[:client_key]) }
  end
end

package "ntp"
package "cronie"
package "screen"
package "git"
package "telnet"
package "rsync"

unless ::File.symlink?("/etc/localtime")
  execute "Move old localtime" do
    command "mv /etc/localtime /etc/localtime.bk"
  end
end

service "crond" do
  action [:enable, :start]
end

link "/etc/localtime" do
  to "/usr/share/zoneinfo/GB"
end
  
cron "Synchronise Time" do
  command "/usr/sbin/ntpd -q"
  minute "10"
end

service "sendmail" do
  action [:disable, :stop]
end
