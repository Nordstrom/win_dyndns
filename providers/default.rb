# Encoding: utf-8
# Copyright 2015 Nordstrom, Inc.
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


include Chef::Mixin::ShellOut
include Windows::Dyndns

# Support whyrun
def whyrun_supported?
  true
end

use_inline_resources

action :set do
  if @current_resource.exists
    Chef::Log.info 'Already set - nothing to do.'
  else
    converge_by("Create #{@new_resource}") do
      config_dyndns
      new_resource.updated_by_last_action true
    end
  end
end

def load_current_resource
  @current_resource = Chef::Resource::WinDyndns.new(@new_resource.name)
  @current_resource.name(@new_resource.setting)
  @current_resource.exists = config_exists?(@current_resource.name)
end
