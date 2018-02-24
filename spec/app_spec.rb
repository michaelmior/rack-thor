require 'thor'

class TestCLI < Thor
  desc 'foo', 'Command'
  def foo
    puts '{}'
  end

  desc 'bar', 'Command'
  method_options baz: :string
  def bar(corge)
    puts options[:baz]
    puts corge
  end
end

describe 'test app' do
  def app
    RackThor.new(TestCLI).router
  end

  it 'can run a simple command' do
    post '/foo'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("{}\n")
  end

  it 'can run a command with options' do
    post '/bar', {args: ['grault'], options: {baz: 'quux'}}
    expect(last_response).to be_ok
    expect(last_response.body).to eq("quux\ngrault\n")
  end
end
