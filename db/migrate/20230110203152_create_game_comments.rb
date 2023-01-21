class CreateGameComments < ActiveRecord::Migration[6.1]
  def change
    create_table :game_comments do |t|
      t.references :member, null: false, foreign_key: true
      t.references :game_review, null: false, foreign_key: true
      t.text :game_comment, null: false

      t.timestamps
    end
  end
end
