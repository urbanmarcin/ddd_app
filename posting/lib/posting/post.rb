# frozen_string_literal: true

module Posting
  class Post
    include AggregateRoot
    TitleInvalid = Class.new(StandardError)
    AlreadyPublished = Class.new(StandardError)
    NotApproved = Class.new(StandardError)
    AlreadyApproved = Class.new(StandardError)

    def initialize(id)
      @id = id
      @state = :draft
    end

    def create_draft(title, description, title_max_length)
      raise TitleInvalid, 'Title is empty' if title.blank?

      apply DraftCreated.new(
        data:
          {
            uid: @id,
            title: title,
            description: description,
            title_max_length: title_max_length
          }
      )
    end

    def remove_post
      apply PostRemoved.new(data: { uid: @id })
    end

    def publish_post
      raise AlreadyPublished if @state == :published
      raise NotApproved if @state != :approved

      apply PostPublished.new(data: { uid: @id })
    end

    def mark_as_approved
      raise AlreadyPublished if @state == :published
      raise AlreadyApproved if @state == :approved

      apply PostMarkedAsApproved.new(data: { uid: @id })
    end

    on PostMarkedAsApproved do |_|
      @state = :approved
    end

    on PostRemoved do |_|
      @state = :removed
    end

    on DraftCreated do |event|
      @title = Posting::Title.new(
        event.data[:title],
        event.data[:title_max_length]
      )
      @description = event.data[:description]
    end

    on PostPublished do |_|
      @state = :published
    end
  end
end
