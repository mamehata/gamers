class CreateGameLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :game_likes do |t|
      t.references :member, null: false, foreign_key: true
      t.references :game_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
