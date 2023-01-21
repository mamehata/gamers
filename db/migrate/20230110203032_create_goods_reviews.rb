class CreateGoodsReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_reviews do |t|
      t.integer :member_, null: false, foreign_key: true
      t.string :goods_name, null: false
      t.text :goods_summary, null: false
      t.text :goods_impression, null: false
      t.integer :goods_price, null: false
      t.float :goods_rating, null: false

      t.timestamps
    end
  end
end
