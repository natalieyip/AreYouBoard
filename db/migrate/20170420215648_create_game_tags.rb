class CreateGameTags < ActiveRecord::Migration[5.0]
  def change
    create_table :game_tags do |t|
      t.references :tag
      t.references :game

      t.timestamps
    end
  end
end
