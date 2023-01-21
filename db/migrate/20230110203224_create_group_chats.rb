class CreateGroupChats < ActiveRecord::Migration[6.1]
  def change
    create_table :group_chats do |t|
      t.integer :member_id, null: false, foreign_key: true
      t.integer :group_id, null: false, foreign_key: true
      t.text :group_chat, null: false

      t.timestamps
    end
  end
end
