class CreateGroupRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :group_rooms do |t|
      t.integer :room_owner_id, null: false

      t.timestamps
    end
  end
end
