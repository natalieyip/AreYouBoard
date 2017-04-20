class Friendsrequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :friend, class_name: "User"

  def accept_request
      Friendship.create(user_id: recipient_id, friend_id: sender_id)
      Friendrequest.find(id).update_attributes(status: 1)
  end
end
