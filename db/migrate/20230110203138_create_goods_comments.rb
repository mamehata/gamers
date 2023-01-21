class CreateGoodsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_comments do |t|
      t.integer :member_id, null: false, foreign_key: true
      t.integer :goods_review_id, null: false, foreign_key: true
      t.text :goods_comment, null: false

      t.timestamps
    end
  end
end
