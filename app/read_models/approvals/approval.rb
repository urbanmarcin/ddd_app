# frozen_string_literal: true

module Approvals
  class Approval < ActiveRecord::Base
    self.table_name = 'approvals'

    def title_with_length
      title.truncate(title_max_length || 120)
    end
  end
end
