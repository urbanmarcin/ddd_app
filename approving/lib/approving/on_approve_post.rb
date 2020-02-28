# frozen_string_literal: true

module Approving
  class OnApprovePost
    include Aggregate

    def call(command)
      aggregate_class = Approval
      aggregate_id = command.aggregate_id

      with_aggregate(aggregate_class, aggregate_id) do |aggregate|
        aggregate.approve_post(
          command.post_id,
          command.approved_by
        )
      end
    end
  end
end
