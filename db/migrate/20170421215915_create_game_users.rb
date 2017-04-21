class CreateGameUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_users do |t|
      t.references :user
      t.references :game

      t.timestamps
    end
  end
end
