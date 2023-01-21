class CreateGameComments < ActiveRecord::Migration[6.1]
  def change
    create_table :game_comments do |t|
      t.integer :member_id, null: false, foreign_key: true
      t.integer :game_review_id, null: false, foreign_key: true
      t.text :game_comment, null: false

      t.timestamps
    end
  end
end
