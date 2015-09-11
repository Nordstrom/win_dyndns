if defined?(ChefSpec)
  def enable_win_shadowcopy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:win_dyndns, :dns, resource_name)
  end

  def schedule_win_shadowcopy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:win_dyndns, :dynamic_dns_reg, resource_name)
  end
end
