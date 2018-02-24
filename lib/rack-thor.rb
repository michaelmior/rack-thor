require 'hanami/router'
require 'stringio'

class RackThor
  attr_reader :router

  def initialize(cli)
    @cli = cli
    @router = Hanami::Router.new
    cli.all_commands.each do |name, c|
      @router.post "/#{name}", to: ->(env) do
        req = Rack::Request.new(env)
        begin
          $stdout = StringIO.new
          command = @cli.all_commands[name]
          @cli.new([], req.params['options'] || {}, {
            current_command: command,
            command_options: command.options
          }).invoke(name, req.params['args'] || [])
          $stdout.close
          [200, {}, [$stdout.string]]
        ensure
          $stdout = STDOUT
        end
      end
    end
  end
end
