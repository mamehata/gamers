class CreateGameReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_review_tags do |t|
      t.integer :game_tag_id, null: false, foreign_key: true
      t.integer :game_review_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
