# frozen_string_literal: true

module Posting
  class OnRemovePost
    include Aggregate

    def call(command)
      aggregate_class = Post
      aggregate_id = command.aggregate_id

      with_aggregate(aggregate_class, aggregate_id) do |aggregate|
        aggregate.remove_post
      end
    end
  end
end
