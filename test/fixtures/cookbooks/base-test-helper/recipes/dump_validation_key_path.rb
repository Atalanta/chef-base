#
# Cookbook Name:: base-test-helper
# Recipe:: dump_validation_key_path
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

require 'pathname'

class ::Chef::Recipe
  include ::Opscode::ChefClient::Helpers
end

directory Pathname(node['chef']['dump']['config']).dirname.to_s do
  recursive true
end

file node['chef']['dump']['config'] do
  owner "root"
  mode "0400"
end


ruby_block 'dump_chef_client_config' do
  block do
    require 'json'

    validation_hash = { :validation_key => Chef::Config[:validation_key] }
    
    File.open(node['chef']['dump']['config'], 'w') { |file| file.write(JSON.pretty_generate(validation_hash, {allow_nan: true })) }
  end
end
