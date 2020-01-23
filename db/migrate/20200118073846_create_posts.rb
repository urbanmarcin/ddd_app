class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :uid
      t.string :state

      t.timestamps null: false
    end
  end
end
