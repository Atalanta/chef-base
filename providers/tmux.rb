#
# Cookbook Name:: base
# Provider:: tmux
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

action :install do

  package "tmux"

  template "/etc/tmux.conf" do
    mode 0644
    cookbook new_resource.cookbook
    variables({
      :prefix_key => new_resource.prefix_key
    })
  end
  
  new_resource.updated_by_last_action(true)
end
