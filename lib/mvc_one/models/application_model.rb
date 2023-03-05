# frozen_string_literal: true

require 'dry-struct'

module Types
  include Dry.Types()
end

# Domain model
module MvcOne
  class ApplicationModel < Dry::Struct
  end
end
