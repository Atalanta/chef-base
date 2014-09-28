#
# Cookbook Name:: base
# Provider:: system_user
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

action :create do

  # Install system_user
  if new_resource.group
    users_manage new_resource.group do
      group_id 2411
      action [ :remove, :create ]
    end

    package 'sudo'

    sudo new_resource.group do
      group "%#{new_resource.group}"
      nopasswd true
      defaults ['!requiretty','env_reset']
    end
    
    new_resource.updated_by_last_action(true)
  end

end
