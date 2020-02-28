# frozen_string_literal: true

module Approving
  class Approval
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def approve_post(post_id, approved_by)
      apply PostApproved.new(
        data:
          {
            uid: @id,
            post_id: post_id,
            approved_by: approved_by
          }
      )
    end

    on PostApproved do |event|
      @post_id = event.data[:post_id]
      @approved_by = event.data[:approved_by]
    end
  end
end
