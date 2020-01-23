# frozen_string_literal: true

require 'dry-struct'

module Posting
end

module Types
  include Dry.Types()
end

require_dependency 'posting/draft_created'
require_dependency 'posting/create_draft'
require_dependency 'posting/on_create_draft'
