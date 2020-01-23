# frozen_string_literal: true

module Posting
  class PostPublished < Event
    attribute :uid, Types::String
  end
end
