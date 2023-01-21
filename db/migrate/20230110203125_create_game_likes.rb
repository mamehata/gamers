class CreateGameLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :game_likes do |t|
      t.integer :member_id, null: false, foreign_key: true
      t.integer :game_review_, null: false, foreign_key: true

      t.timestamps
    end
  end
end
