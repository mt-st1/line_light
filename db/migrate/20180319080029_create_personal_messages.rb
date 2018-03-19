class CreatePersonalMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_messages do |t|
      t.text :content

      t.timestamps
    end
  end
end
