#
# Cookbook Name:: base
# Provider:: hostname
#
# Copyright 2013-2014, Atalanta Systems Ltd
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


def whyrun_supported?
  true
end

use_inline_resources

action :config do

  fqdn = new_resource.fqdn
  hostname = fqdn[/([^\.]*)/,0]
  if valid_hostname?(fqdn)
    # Configure system temp hostname
    execute "hostname #{hostname}" do
      Chef::Log.info "Set node hostname to #{hostname}"
    end

    # Configure system /etc/hosts file
    hostsfile_entry node['ipaddress'] do
      Chef::Log.info "Set node fqdn to #{fqdn} at /etc/hosts"
      hostname fqdn
      aliases [hostname]
      action :create
    end

    hostsfile_entry '127.0.0.1' do
      Chef::Log.info "Set node IPv4 localhost address"
      hostname 'localhost.localdomain'
      aliases ['localhost', 'localhost4','localhost4.localdomain4']
      action :create
    end

    hostsfile_entry '::1' do
      Chef::Log.info "Set node IPv6 localhost address"
      hostname 'localhost6.localdomain6'
      aliases ['localhost6']
      action :create
    end

    # Configure system permanent hostname
    execute "echo #{hostname} > /etc/hostname" do
      Chef::Log.info "Set node premanent hostname to #{hostname}"
    end
  end
  
  new_resource.updated_by_last_action(true)
end

def valid_hostname?(hostname)
  true
end
