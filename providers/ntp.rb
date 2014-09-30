# -*- encoding : utf-8 -*-
#
# Cookbook Name:: base
# Provider:: bash_d
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

require 'etc'

def whyrun_supported?
  true
end

use_inline_resources

action :config do

  # Set timezone
  file '/etc/timezone' do
    mode 0644
    content new_resource.timezone
  end

  execute 'set host timezone' do
    command 'dpkg-reconfigure --frontend noninteractive tzdata'
  end

  # Install ntp
  package 'ntp'

  # sync time with ntpd once a hour
  cron 'time_sync' do
    minute '10'
    command '/usr/sbin/ntpd -q'
  end
  
  new_resource.updated_by_last_action(true)
end
