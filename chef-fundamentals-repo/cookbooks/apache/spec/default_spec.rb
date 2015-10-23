require 'chefspec'

at_exit { ChefSpec::Coverage.report! }

describe 'apache::default' do
  let(:chef_run) \
  { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs apache2' do
    expect(chef_run).to install_package('httpd')
  end

  it 'creates clowns.conf' do
    expect(chef_run).to create_template('/etc/httpd/conf.d/clowns.conf')
  end

end
