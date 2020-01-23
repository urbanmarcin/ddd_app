class AddTitleMaxLengthToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title_max_length, :integer
  end
end
