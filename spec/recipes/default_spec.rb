RSpec.describe 'testsetup::default' do
  include ChefRun

  it 'enables dynamic DNS registration on the client' do
    expect(chef_run).to enable_win_dyndns('default')
  end

  it 'disables dynamic DNS registration on the client' do
    expect(chef_run).to disable_win_dyndns('default')
  end
end
