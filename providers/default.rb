# Encoding: utf-8
# Author:: Sandeep Bhat (<sandeep.s.bhat@nordstrom.com>)
# Cookbook Name:: win_dyndns
# Provider:: win_dyndns
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
