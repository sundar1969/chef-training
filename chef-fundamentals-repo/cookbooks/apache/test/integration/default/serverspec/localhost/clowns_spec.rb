require 'serverspec'

set :backend, :exec

describe 'clowns site' do
  it 'responds on port 80 tcp' do
    expect(port 80).to be_listening 'tcp'
  end

  it 'returns clowns in the HTML body' do
    expect((command 'curl localhost:80').stdout).to match (/clowns/)
  end  

## better syntax. Strict enforcing of protocol
  describe port(80) do
    it { should be_listening.with('tcp') }
  end
end
