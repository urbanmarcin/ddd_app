# frozen_string_literal: true

module Posts
  class CaptureSagaState

    def call(event)
      capture_state(event)
    rescue ActiveRecord::RecordNotUnique
      retry
    end

    private

    def capture_state(event)
      ActiveRecord::Base.transaction do
        post_uid = event.post_id
        state = init_saga_state(post_uid)
        state.lock!
        state.data['approved_by'] << event.approved_by
        set_saga_state(state, post_uid)
        state.save!
      end
    end

    def init_saga_state(post_uid)
      state = State.where(post_uid: post_uid).first
      return state if state

      State.create!(
        post_uid: post_uid,
        data: { approved_by: [], completed: false }
      )
    end

    def set_saga_state(state, post_uid)
      return if state.data['approved_by'].size != 3 || state.data['completed']

      cmd = Posting::MarkAsApproved.new(
        uid: post_uid
      )
      Rails.configuration.command_bus.call(cmd)
      state.data['completed'] = true
    end
  end
end
