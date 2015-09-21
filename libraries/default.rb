
module Windows
  # helpers for the win_dyndns LWRP
  module Dyndns
    def config_exists?(*)
      setting = new_resource.setting
      Chef::Log.info "Checking for existence of dynamic DNS option: #{setting}"
      @exists ||= begin
        cmd = powershell_out('(gwmi win32_networkadapterconfiguration | ?{$_.IPenabled -eq $true} | select FullDNSRegistrationEnabled).FullDNSRegistrationEnabled')
        cmd.stderr.empty? && cmd.stdout.include?(setting)
      end
    end

    def config_dyndns
      setting = '$' + new_resource.setting
      Chef::Log.info "Setting dynamic DNS registration to #{setting}"
      powershell_out("(gwmi win32_networkadapterconfiguration | ?{$_.IPenabled -eq $true}).SetDynamicDNSRegistration(#{setting})", returns: [0])
    end
  end
end
