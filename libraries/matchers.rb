if defined?(ChefSpec)
  def enable_win_dyndns(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:win_dyndns, :enable, resource_name)
  end

  def disable_win_dyndns(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:win_dyndns, :disable, resource_name)
  end
end
