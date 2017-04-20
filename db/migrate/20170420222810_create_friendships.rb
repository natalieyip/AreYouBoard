class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :user_id
      t.references :friend_id

      t.timestamps
    end
  end
end
