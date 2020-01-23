# frozen_string_literal: true

module Posting
  class PublishPost < Command
    attribute :uid, Types::String

    alias :aggregate_id :uid
  end
end
