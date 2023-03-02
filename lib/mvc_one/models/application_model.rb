# frozen_string_literal: true

require 'dry-struct'

module Types
  include Dry.Types()
end

# Domain model
class MvcOne::ApplicationModel < Dry::Struct
end
