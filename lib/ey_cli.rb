module EYCli
  VERSION = '0.1.0'

  require 'hashie/mash'
  require 'json'
  require 'multi_json'

  require 'ey_cli/api'
  require 'ey_cli/cli'
  require 'ey_cli/git_utils'
  require 'ey_cli/command_manager'
  require 'ey_cli/options_parser'
  require 'ey_cli/smarty_parser'
  require 'ey_cli/term'

  require 'ey_cli/models/base'
  require 'ey_cli/models/account'
  require 'ey_cli/models/app'
  require 'ey_cli/models/environment'

  require 'ey_cli/controllers/accounts'
  require 'ey_cli/controllers/apps'
  require 'ey_cli/controllers/environments'

  require 'ey_cli/commands/base'
  require 'ey_cli/commands/create_app'
  require 'ey_cli/commands/help'
  require 'ey_cli/commands/accounts'
  require 'ey_cli/commands/create_env'
  require 'ey_cli/commands/deploy'

  def self.api(endpoint = nil)
    @api ||= Api.new(endpoint)
  end

  def self.term(input = $stdin, output = $stdout)
    @ui ||= Term.new(input, output)
  end

  def self.command_manager
    @command_manager ||= EYCli::CommandManager.new
  end
end
