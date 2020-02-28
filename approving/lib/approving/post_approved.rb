# frozen_string_literal: true

module Approving
  class PostApproved < Event
    attribute :uid, Types::String
    attribute :post_id, Types::String
    attribute :approved_by, Types::String
  end
end
