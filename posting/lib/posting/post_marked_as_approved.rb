# frozen_string_literal: true

module Posting
  class PostMarkedAsApproved < Event
    attribute :uid, Types::String
  end
end
