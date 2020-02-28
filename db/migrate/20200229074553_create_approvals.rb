class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :approved_by
      t.string :post_uid
      t.timestamps null: false
    end
  end
end
