class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :target_id

      t.timestamps
    end
    add_index :friends, :user_id
    add_index :friends, :target_id
    add_index :friends, [:user_id, :target_id], unique: true
  end
end
