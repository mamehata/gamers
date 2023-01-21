class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: { to_table: :members }
      t.references :followed, null: false, foreign_key: { to_table: :members }

      t.timestamps
    end
  end
end
