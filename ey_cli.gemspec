## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'ey_cli'
  s.version           = '0.1.0'
  s.date              = '2011-09-23'
  s.rubyforge_project = 'ey_cli'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "More user friendly CLI for Engine Yard cloud"
  s.description = "More user friendly CLI for Engine Yard cloud. Use undocumented APIs"

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["David Calavera"]
  s.email    = 'david.calavera@gmail.com'
  s.homepage = 'http://github.com/calavera/ey_cli'

  s.executables = ['ey_cli']

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency('faraday')
  s.add_dependency('faraday_middleware')
  s.add_dependency('faraday-stack')
  s.add_dependency('highline')
  s.add_dependency('hashie')
  s.add_dependency('json')
  s.add_dependency('multi_json')
  s.add_dependency('grit')

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency('rake', '~> 0.9')
  s.add_development_dependency('rspec')
  s.add_development_dependency('webmock')
  s.add_development_dependency('fakefs')

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    Rakefile
    bin/ey_cli
    ey_cli.gemspec
    lib/ey_cli.rb
    lib/ey_cli/api.rb
    lib/ey_cli/cli.rb
    lib/ey_cli/model/account.rb
    lib/ey_cli/model/app.rb
    lib/ey_cli/model/base.rb
    lib/ey_cli/model/environment.rb
    lib/ey_cli/options_parser.rb
    lib/ey_cli/smarty_parser.rb
    spec/ey_cli/model/base_spec.rb
    spec/ey_cli/options_parser_spec.rb
    spec/ey_cli/smarty_parser_spec.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
end
