class CreateRoomMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :room_members do |t|
      t.references :group_member, null: false, foreign_key: true
      t.references :group_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
