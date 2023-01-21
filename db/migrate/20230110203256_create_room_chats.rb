class CreateRoomChats < ActiveRecord::Migration[6.1]
  def change
    create_table :room_chats do |t|
      t.references :group_room, null: false, foreign_key: true
      t.references :group_member, null: false, foreign_key: true
      t.text :room_chat, null: false

      t.timestamps
    end
  end
end
