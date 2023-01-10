class CreateGoodsReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_review_tags do |t|
      t.references :goods_tag, null: false, foreign_key: true
      t.references :goods_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
