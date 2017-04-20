class CreateFriendsrequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friendsrequests do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id

      # request status codes: 0 - pending, 1 - accepted, 2 - rejected, 3 - blocked
      t.integer :status
      t.timestamps
    end
  end
end
