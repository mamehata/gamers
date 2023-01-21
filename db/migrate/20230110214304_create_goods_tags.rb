class CreateGoodsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_tags do |t|
      t.string :goods_tag_name

      t.timestamps
    end
  end
end
