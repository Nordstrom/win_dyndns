def enable_dynamic_dns_reg
  powershell_script 'enable_dynamic_dns_reg_script' do
    code <<-EOH
    $nics = ((Get-WmiObject win32_networkadapterconfiguration | ?{$_.IPenabled -eq $true}) | select IPAddress)
    if($nic.count -eq 1) {
      $nics.SetDynamicDNSRegistration($true)
      }
    else{
      # gracefully bail out
      echo "Multiple NIC adapters. Unable to set dyanmic dns attribute"
      exit 0
    }
    EOH
  end
end

def disable_dynamic_dns_reg
  powershell_script 'disable_dynamic_dns_reg_script' do
    code <<-EOH
    $nics = ((Get-WmiObject win32_networkadapterconfiguration | ?{$_.IPenabled -eq $true}) | select IPAddress)
    if($nic.count -eq 1) {
      $nics.SetDynamicDNSRegistration($false)
      }
    else{
      # gracefully bail out
      echo "Multiple NIC adapters. Unable to set dyanmic dns attribute"
      exit 0
    }
    EOH
  end
end
