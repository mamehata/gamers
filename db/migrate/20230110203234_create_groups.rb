class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :game_review, null: false, foreign_key: true
      t.integer :group_owner_id, null: false
      t.string :group_name, null: false
      t.text :group_introduction, null: false

      t.timestamps
    end
  end
end
