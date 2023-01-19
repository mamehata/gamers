class CreateGroupRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :group_rooms do |t|
      t.references :room_owner, null: false, foreign_key: { to_table: :members }
      t.references :group, null: false, foreign_key: true
      t.string :room_name, null: false

      t.timestamps
    end
  end
end
