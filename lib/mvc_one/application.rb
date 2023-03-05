# frozen_string_literal: true

require 'yaml'
require 'rack'
require 'rack/session'

module MvcOne
  # Rack friendly launcher for project
  class Application
    # Main application config
    class Config
      def self.env
        ENV.fetch('APP_ENV', 'development')
      end

      def self.test?
        env == 'test'
      end

      def self.secrets
        YAML.load_file('config/secrets.yml')[Application::Config.env]
      end

      def self.db_config
        YAML.load_file('config/database.yml')[Application::Config.env]
      end
    end

    def initialize
      @router = RegexpRouter.new(File.join('app', 'config', 'routes.rb'))
    end

    def self.launch
      Rack::Builder.new do |builder|
        builder.use Rack::Session::Cookie, domain: 'localhost', path: '/', expire_after: 3600 * 24,
                                           secret: Application::Config.secrets['session_cookie']
        builder.run Application.new
      end
    end

    def call(env)
      request = Rack::Request.new(env)
      result = @router.resolve(request.path, request.request_method)
      controller = result.controller.new(env, result.params, request)
      controller.resolve(result.action)
    end
  end
end

require_relative 'regexp_router'
require_relative 'contracts/application_contract'
require_relative 'controllers/application_controller'
require_relative 'models/application_model'
require_relative 'repositories/application_relation'
require_relative 'repositories/application_repository'
require_relative 'serializers/application_serializer'
