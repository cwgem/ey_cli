module EYCli
  module Controller
    class Apps
      include EYCli::GitUtils

      def create(account, base = Dir.pwd)
        if git_repository?(base)
          app = EYCli::Model::App.create({
            :account               => account,
            'app[name]'            => File.basename(base),
            'app[app_type_id]'     => fetch_type(base).to_s,
            'app[repository_uri]'  => fetch_repository(base)
          })

          if app.errors?
            EYCli.term.print_errors(app.errors, "App creation failed:")
          else
            EYCli.term.success("App created successfully")
          end
          app
        else
          EYCli.term.error("Not a git repository: #{base}")
        end
      end

      def fetch_type(base)
        if File.exist?(File.join(base, 'config.ru')) && File.exist?(File.join(base, 'config', 'environment.rb'))
          :rails3
        elsif File.exist?(File.join(base, 'config', 'environment.rb'))
          :rails2
        elsif File.exist?(File.join(base, 'config.ru'))
          :rack
        else # Raise unkown application type?
          :rails3
        end
      end

      def fetch_app(account = nil, options = {}, base = Dir.pwd)
        if account
          # search for account. Should we really care?
        else
          all_apps = EYCli::Model::App.all
          return all_apps.first if all_apps.empty? || all_apps.size == 1

          app = if options[:app_name]
            EYCli::Model::App.find_by_name(options[:app_name], all_apps)
          elsif git_repository?(base)
            EYCli::Model::App.find_by_repository_uri(fetch_repository(base), all_apps)
          end

          unless app
            choice = EYCli.term.choose_resource(all_apps,
                                       "I don't know which app you want to create the environment for.",
                                       "Please, select an application:")
            app = EYCli::Model::App.find_by_name(choice, all_apps)
          end
          app
        end
      end
    end
  end
end
