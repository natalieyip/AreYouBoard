class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :players, null: false
      t.string :age, null: false
      t.string :play_time, null: false
      t.integer :complexity, null: false
      t.string :publisher, null: false
      t.string :img_url, null: false
      t.text :description, null: false

      t.timestamps, null: false
    end
  end
end
