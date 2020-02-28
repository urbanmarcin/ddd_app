# frozen_string_literal: true

require 'dry-struct'

module Approving
end

module Types
  include Dry.Types()
end

require_dependency 'approving/approve_post'
