# frozen_string_literal: true

module Posts
  class OnPostPublished

    def call(event)
      post = Post.where(
        uid: event.data[:uid]
      ).first

      post.update!(state: 'Published')
    end
  end
end
