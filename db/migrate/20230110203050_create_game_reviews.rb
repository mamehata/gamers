class CreateGameReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :game_reviews do |t|
      t.references :member, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :game_title, null: false
      t.text :game_summary, null: false
      t.text :game_impression, null: false
      t.integer :game_price, null: false
      t.float :game_rating, null: false

      t.timestamps
    end
  end
end
