class CreateGameTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_tags do |t|
      t.string :game_tag_name

      t.timestamps
    end
  end
end
