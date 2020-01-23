#frozen_string_literal: true

module Posting
  class Title
    attr_reader :title

    def initialize(title, length)
      @title = title
      @length = length || 120
    end

    def title_with_length
      @title[0..@length]
    end
  end
end
