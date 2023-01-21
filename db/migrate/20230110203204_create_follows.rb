class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false, foreign_key: { to_table: :members }
      t.integer :followed_id, null: false, foreign_key: { to_table: :members }

      t.timestamps
    end
  end
end
