# frozen_string_literal: true


module Posts
  class Post < ActiveRecord::Base
    self.table_name = 'posts'

    def title_with_length
      title.truncate(title_max_length || 120)
    end
  end
end
