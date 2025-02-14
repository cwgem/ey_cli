module EYCli
  module Model
    class Environment < Base
      base_path 'apps/%s/environments'

      def self.create_path(hash)
        app = hash.delete(:app)
        raise Faraday::Error::ClientError, {:body => MultiJson.encode({:errors => {:app => 'Not found'}})} unless app
        base_path % app.id
      end

      def deploy(app, options = {})
        path = "#{self.class.resolve_child_path([app.id, id])}/deploy"
        deployment_options = deployment_configurations[app.name]

        post_params = {
          'deployment[migrate]'         => options[:migrate] || deployment_options.migrate.perform,
          'deployment[migrate_command]' => options[:migrate_command] || deployment_options.migrate.command,
          'deployment[ref]'             => options[:ref] || deployment_options.ref || 'HEAD'
        }

        response = EY.api.post(path, nil, post_params)
        Hashie::Mash.new response['deployment']
      rescue Faraday::Error::ClientError => e
        Hashie::Mash.new MultiJson.decode(e.response[:body])
      end
    end
  end
end
