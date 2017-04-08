require 'hanami/router'
require 'stringio'

class RackThor
  attr_reader :router

  def initialize(cli)
    @cli = cli
    @router = Hanami::Router.new
    cli.all_commands.each do |name, c|
      @router.get "/#{name}", to: ->(env) do
        begin
          $stdout = StringIO.new
          command = @cli.all_commands[name]
          @cli.new([], {}, {
            current_command: command,
            command_options: command.options
          }).invoke(name)
          $stdout.close
          [200, {}, [$stdout.string]]
        ensure
          $stdout = STDOUT
        end
      end
    end
  end
end
