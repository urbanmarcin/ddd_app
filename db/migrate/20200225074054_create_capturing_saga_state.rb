class CreateCapturingSagaState < ActiveRecord::Migration
  def change
    create_table :capturing_saga_states do |t|
      t.string :post_uid
      t.jsonb :data
    end

    add_index :capturing_saga_states, :post_uid, unique: true
  end
end
