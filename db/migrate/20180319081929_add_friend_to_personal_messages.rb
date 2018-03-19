class AddFriendToPersonalMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :personal_messages, :friend, foreign_key: true
  end
end
