
require 'dry-struct'

module Types
  include Dry.Types()
end

module Posting
  class CreateDraft < Dry::Struct::Value
    Invalid = Class.new(StandardError)

    attribute :title, Types::String
    attribute :description, Types::String.optional
    attribute :uid, Types::String

    alias :aggregate_id :uid
    # custom error matched to this class
    def self.new(*)
      super
    rescue Dry::Struct::Error => doh
      raise Invalid, doh
    end
  end
end
