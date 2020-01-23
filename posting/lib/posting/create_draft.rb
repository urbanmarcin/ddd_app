# frozen_string_literal: true

module Posting
  class CreateDraft < Command

    attribute :title, Types::String
    attribute :title_max_length, Types::Coercible::Integer.optional
    attribute :description, Types::String.optional
    attribute :uid, Types::String

    alias :aggregate_id :uid
  end
end
