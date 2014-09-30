# -*- encoding : utf-8 -*-
#
# Cookbook Name:: base
# Resource:: default
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

actions :config
default_action :config

# hostname
attribute :hostname, :kind_of => [String, NilClass], :name_attribute => true, :default => "unassigned.local"
# users
attribute :system_user, :kind_of => [String, FalseClass, NilClass], :default => 'devops'
# features
attribute :bash_d, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
attribute :delete_validation,  :kind_of => [TrueClass, FalseClass, NilClass], :default => true
attribute :ntp, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
# packages
attribute :tmux, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
attribute :tmux_prefix_key, :kind_of => String, :default => 'C-z'
attribute :tmux_cookbook, :kind_of => String, :default => 'base'
attribute :emacs, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
attribute :git, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
