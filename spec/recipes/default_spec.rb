RSpec.describe 'testsetup::default' do
  include ChefRun

  it 'assigns the default dns resolvers' do
    expect(chef_run).to dns_win_dyndns('default')
  end

  it 'ensures dynamic dns registration is enabled' do
    expect(chef_run).to dynamic_dns_reg_win_shadowcopy('default')
  end
end
