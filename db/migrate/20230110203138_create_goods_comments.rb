class CreateGoodsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_comments do |t|
      t.references :member, null: false, foreign_key: true
      t.references :goods_review, null: false, foreign_key: true
      t.text :goods_comment, null: false

      t.timestamps
    end
  end
end
