class CreateGameReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_review_tags do |t|
      t.references :game_tag, null: false, foreign_key: true
      t.references :game_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
