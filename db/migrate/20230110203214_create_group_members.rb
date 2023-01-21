class CreateGroupMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_members do |t|
      t.integer :member_id, null: false, foreign_key: true
      t.integer :group_id, null: false, foreign_key: true
      t.integer :group_room_id, null: true, foreign_key: true

      t.timestamps
    end
  end
end
