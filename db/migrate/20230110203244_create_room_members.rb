class CreateRoomMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :room_members do |t|
      t.integer :group_member_id, null: false, foreign_key: true
      t.integer :group_room_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
