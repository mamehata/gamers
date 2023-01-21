class CreateRoomChats < ActiveRecord::Migration[6.1]
  def change
    create_table :room_chats do |t|
      t.integer :group_room_id, null: false, foreign_key: true
      t.integer :group_member_id, null: false, foreign_key: true
      t.text :room_chat, null: false

      t.timestamps
    end
  end
end
