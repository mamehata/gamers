class CreateGameTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_tags do |t|
      t.string :game_tag_name, null: false

      t.timestamps
    end
  end
end
