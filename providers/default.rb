# Encoding: utf-8
# Author:: Sandeep Bhat (<sandeep.s.bhat@nordstrom.com>)
# Cookbook Name:: win_dyndns
# Provider:: win_dyndns
#

# Support whyrun
def whyrun_supported?
  true
end

use_inline_resources

action :dns do
  if @current_resource.exists
    Chef::Log.info 'Already set - nothing to do.'
  else
    converge_by("Create #{@new_resource}") do
      assign_dns
      new_resource.updated_by_last_action true
    end
  end
end

action :dynamic_dns_reg do
  if @current_resource.exists
    Chef::Log.info 'Already set - nothing to do.'
  else
    converge_by("Create #{@new_resource}") do
      set_dynamic_dns_reg
      new_resource.updated_by_last_action true
    end
  end
end

def load_current_resource
  @current_resource = Chef::Resource::WseUtilWindowsNetwork.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.inet_resolution_needed(@new_resource.inet_resolution_needed)
  return unless dns_configured?(@current_resource.inet_resolution_needed)
  @current_resource.exists = true
end
