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

action :enable do
  if @current_resource.exists
    Chef::Log.info 'Already set - nothing to do.'
  else
    converge_by("Create #{@new_resource}") do
      enable_dynamic_dns_reg
      new_resource.updated_by_last_action true
    end
  end
end

action :disable do
  if @current_resource.exists
    Chef::Log.info 'Already set - nothing to do.'
  else
    converge_by("Create #{@new_resource}") do
      disable_dynamic_dns_reg
      new_resource.updated_by_last_action true
    end
  end
end

def load_current_resource
  @current_resource = Chef::Resource::WinDyndns.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.enable_dyndns_reg(@new_resource.enable_dyndns_reg)
  @current_resource.disable_dyndns_reg(@new_resource.disable_dyndns_reg)
  @current_resource.exists = true
end
