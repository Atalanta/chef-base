#
# Cookbook Name:: base
# Provider:: default
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

include Chef::DSL::IncludeRecipe

def whyrun_supported?
  true
end

use_inline_resources

action :config do

  # Set node hostname
  base_hostname new_resource.hostname if new_resource.hostname

  package 'emacs24-nox' if new_resource.emacs
  package 'git' if new_resource.git

  base_tmux new_resource.tmux_prefix_key do
    cookbook new_resource.tmux_cookbook
  end if new_resource.tmux

  base_system_user new_resource.system_user if new_resource.system_user

  include_recipe 'chef-client::delete_validation' if new_resource.delete_validation
  
  new_resource.updated_by_last_action(true)
end
