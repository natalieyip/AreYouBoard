class GamesUsers < ActiveRecord::Migration[5.0]
  def change
  	 create_table :games_users do |t|
      t.integer :game_id
      t.integer :user_id
  	end
	end
end