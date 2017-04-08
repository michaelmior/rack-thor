require 'thor'

class TestCLI < Thor
  desc 'test', 'Command'
  def test
    puts '{}'
  end
end

describe 'test app' do
  def app
    RackThor.new(TestCLI).router
  end

  it 'can run a command' do
    get '/test'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("{}\n")
  end
end
