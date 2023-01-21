class CreateGoodsReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_review_tags do |t|
      t.integer :goods_tag_id, null: false, foreign_key: true
      t.integer :goods_review_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
