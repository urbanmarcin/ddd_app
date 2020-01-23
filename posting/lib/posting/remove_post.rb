# frozen_string_literal: true

module Posting
  class RemovePost < Command
    attribute :uid, Types::String

    alias :aggregate_id :uid
  end
end
