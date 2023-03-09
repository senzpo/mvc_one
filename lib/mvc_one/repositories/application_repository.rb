# frozen_string_literal: true

require 'sequel'

# Main gateway for persisted storage
module MvcOne
  class ApplicationRepository
    class NotFoundRecord < StandardError; end

    attr_reader :table_name

    def self.db_config
      Application::Config.db_config
    end

    DB = Sequel.connect(db_config['db']['connection_line'])
    DB.loggers << Logger.new($stdout)
    DB.sql_log_level = :debug
  end
end
