# set these string values to something applicaable for your environment and
# hostname standard
default['win_dyndns']['corp_campus_list_str'] = '0001,0803,0805,0807,0860,0862,0864,0894,0145,0606,0808,0809,0810,0870'

# setting some attributes for the DNS resolvers.  set different values based on DNS domain
case node['domain']
when 'nordstrom.net'
  default['win_dyndns']['DnsNonCorpNoInet'] = ['10.16.172.129', '10.16.172.131', '10.12.137.20', '10.12.137.21']
  default['win_dyndns']['DnsNonCorpInet'] = ['10.1.82.144', '10.1.81.145', '10.12.138.20', '10.12.138.21']
  default['win_dyndns']['DnsCorpNoInet'] = ['10.12.137.20', '10.12.137.21', '10.16.172.129', '10.16.172.131']
  default['win_dyndns']['DnsCorpInet'] = ['10.12.138.20', '10.12.138.21', '10.1.82.144', '10.1.81.145']
when 'svc.nordstrom.com'
  default['win_dyndns']['DnsNonCorpNoInet'] = ['10.17.78.40', '10.12.161.37']
  default['win_dyndns']['DnsNonCorpInet'] = ['10.17.78.39', '10.12.161.36']
  default['win_dyndns']['DnsCorpNoInet'] = ['10.12.161.37', '10.17.78.40']
  default['win_dyndns']['DnsCorpInet'] = ['10.12.161.36', '10.17.78.39']
else
  Chef::Log.info('win_dyndns cookbook detected this host does NOT fit any prescribed DNS resolver lists...')
end
