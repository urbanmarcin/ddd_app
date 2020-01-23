# frozen_string_literal: true

module Posts
  class OnPostRemoved

    def call(event)
      Post.where(uid: event.data[:uid]).first.destroy!
    end
  end
end
