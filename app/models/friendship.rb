class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"
	 # after creation, create a reciprocal friendship
  after_create do |u|
    # check if friendship already exists
    if Friendship.where(user_id: friend_id, friend_id: user_id).empty?
      reciprocal = Friendship.new(user_id: friend_id, friend_id: user_id)
      reciprocal.save
    end
  end
end
