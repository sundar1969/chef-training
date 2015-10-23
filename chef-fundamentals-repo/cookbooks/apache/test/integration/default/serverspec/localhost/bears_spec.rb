require 'serverspec'

set :backend, :exec

describe 'bears site' do
  it 'responds on port 81' do
    expect(port 81).to be_listening 'tcp'
  end

  it 'returns bears in the HTML body' do
    expect((command 'curl localhost:81').stdout).to match (/bears/)
  end

## better syntax. Strict enforcing of protocol
  describe port(81) do
    it { should be_listening.with('tcp') }
  end
end
