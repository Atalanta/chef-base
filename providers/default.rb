# -*- encoding : utf-8 -*-
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

def chef_solo_search_installed?
  klass = ::Search::const_get('Helper')
  return klass.is_a?(Class)
rescue NameError
  return false
end

action :config do

  # Set node hostname
  base_hostname new_resource.hostname if new_resource.hostname

  package 'emacs24-nox' if new_resource.emacs
  package 'git' if new_resource.git

  base_tmux new_resource.tmux_prefix_key do
    cookbook new_resource.tmux_cookbook
  end if new_resource.tmux

  if new_resource.system_user
    base_system_user new_resource.system_user
    if new_resource.bash_d
      if Chef::Config[:solo] and not chef_solo_search_installed?
        Chef::Log.warn("This recipe uses search. Chef Solo does not support search unless you install the chef-solo-search cookbook.")
      else
        search('users', "groups:#{new_resource.system_user}") do |u|
          u['username'] ||= u['id']
          base_bash_d u['username']
        end  
      end
    end
  end
  
  include_recipe 'chef-client::delete_validation' if new_resource.delete_validation

  new_resource.updated_by_last_action(true)
end
