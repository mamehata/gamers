class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :member_id, null: false, foreign_key: true
      t.integer :group_id, null: false, foreign_key: true
      t.integer :group_chat_id, null: false, foreign_key: true
      t.boolean :see, null: false, default: false

      t.timestamps
    end
  end
end
