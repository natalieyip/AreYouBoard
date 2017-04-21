class AddUserIdToGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :user, index: true
  end
end
