# frozen_string_literal: true

module Posts
  class OnDraftCreated

    def call(event)
      Post.create!(
        title: event.data[:title],
        title_max_length: event.data[:title_max_length],
        description: event.data[:description],
        state: 'Draft',
        uid: event.data[:uid]
      )
    end
  end
end
