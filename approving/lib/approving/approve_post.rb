# frozen_string_literal: true

module Approving
  class ApprovePost < Command

    attribute :approved_by, Types::String
    attribute :post_id, Types::String
    attribute :uid, Types::String

    alias :aggregate_id :uid
  end
end
