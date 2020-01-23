# frozen_string_literal: true

module Posting
  class OnUpdateText
    include Aggregate

    def call(command)
      aggregate_class = Post
      aggregate_id = command.aggregate_id

      with_aggregate(aggregate_class, aggregate_id) do |aggregate|
        aggregate.create_draft(
          command.title,
          command.description,
          command.title_max_length
        )
      end
    end
  end
end
