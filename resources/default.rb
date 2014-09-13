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

attribute :hostname, :kind_of => String, :name_attribute => true, :default => "unassigned.local"
attribute :system_user, :kind_of => [TrueClass, FalseClass, NilClass], :default => 'devops'
attribute :bashd, :kind_of => [TrueClass, FalseClass, NilClass], :default => true
attribute :users, :kind_of => [TrueClass, FalseClass, NilClass], :default => nil
attribute :ssh, :kind_of => [TrueClass, FalseClass, NilClass], :default => nil
attribute :tmux, :kind_of => [TrueClass, FalseClass, NilClass], :default => nil
