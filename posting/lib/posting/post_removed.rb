# frozen_string_literal: true

module Posting
  class PostRemoved < Event
    attribute :uid, Types::String
  end
end
