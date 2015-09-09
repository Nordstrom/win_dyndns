# Encoding: utf-8
# Author:: Sandeep Bhat (<sandeep.s.bhat@nordstrom.com>)
# Cookbook Name:: win_dyndns
# Provider:: win_dyndns
# Copyright:: 2015, Nordstrom, Inc.
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

actions :dns, :dynamic_dns_reg
default_action :dns

attribute :inet_resolution_needed, kind_of: String, default: 'no'

attr_accessor :exists
