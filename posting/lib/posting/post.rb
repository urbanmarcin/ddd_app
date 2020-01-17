module Posting
  class Post

    include AggregateRoot
    TitleInvalid = Class.new(StandardError)


    # states :draft, published, removed

    def initialize(id)
      @id = id   #command.uid
      @state = :draft
    end

    def create_draft(title, description, uid)
      raise TitleInvalid if title.blank?

      apply DraftCreated.new(data: {id: @id, uid: @id, title: title, description: description})
    end

    on DraftCreated do |event|
      @title = event.data[:title]
      @description = event.data[:description]
    end

  end
end
