def dns_configured?(_dns_servers)
end

# rubocop:disable all
def assign_dns
  dns_servers_arr = []
  host_name = node['hostname'].to_s
  if new_resource.inet_resolution_needed.eql?('yes')
    if is_corp_campus?(host_name)
      dns_servers_arr = node['wse_util']['DnsCorpInet']
    else
      dns_servers_arr = node['wse_util']['DnsNonCorpInet']
    end
  else
    if is_corp_campus?(host_name)
      dns_servers_arr = node['wse_util']['DnsCorpNoInet']
    else
      dns_servers_arr = node['wse_util']['DnsNonCorpNoInet']
    end
  end
  dns_servers = arr_to_str(dns_servers_arr)
  powershell_script "assign_dns_script" do
    environment ({ 'dns_servers' => dns_servers })
    code <<-EOH
    $message=""
    $dns_servers_list = $env:dns_servers.split(",")
      try{
       $NICs = Get-WMIObject Win32_NetworkAdapterConfiguration |where{$_.IPEnabled -eq "TRUE"}
       Foreach($NIC in $NICs)
        {
        $message += $NIC.SetDNSServerSearchOrder(@($dns_servers_list)) | Out-String   # set the DNS IPs and capture output to string
        }
      }catch{
        $message += "An error occcured while setting NIC object." + "`n`rError: $_";
      }
      #write-host $message #if necessary, display result messages
    EOH
  end
end
# rubocop:enable all

def corp_campus?(host_name)
  is_corp_campus = false
  corp_campus_list_str = node['win_dyndns']['corp_campus_list_str']
  corp_campus_list = corp_campus_list_str.split(',')
  corp_campus_list.each do |location|
    if host_name.include?(location)
      is_corp_campus = true
      break
    end
  end
  is_corp_campus
end

def set_dynamic_dns_reg
  powershell_script 'set_dynamic_dns_reg_script' do
    code <<-EOH
    $nics=Get-WmiObject "Win32_NetworkAdapterConfiguration where IPEnabled='TRUE'"
    if($nics.count -eq $null){
      $nics.SetDynamicDNSRegistration($true)
      }
    else{
      throw "Multiple NICs. Unable to set"
    }
    EOH
  end
end

def arr_to_str(inp_arr)
  return_str = ''
  inp_arr.each do |ip_str|
    return_str = return_str + ',' + ip_str
  end
  return_str[1..-1]
end
