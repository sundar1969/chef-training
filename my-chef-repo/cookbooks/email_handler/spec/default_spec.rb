require 'chefspec'

at_exit { ChefSpec::Coverage.report! }

describe 'apache::default' do
  let(:chef_run) \
  { ChefSpec::ServerRunner.new.converge(described_recipe) }
end
