# Encoding: utf-8

actions :set
default_action :set

attribute :setting, kind_of: String, required: true, default: 'True', equal_to: %w(True False)

attr_accessor :exists
