class CreateGroupRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :group_rooms do |t|
      t.integer :room_owner_id, null: false
      t.references :group, null: false, foreign_key: true
      t.string :room_name, null: false

      t.timestamps
    end
  end
end
