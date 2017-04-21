class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_friendrequests, class_name: "Friendrequest", foreign_key: "sender_id"
  has_many :received_friendrequests, class_name: "Friendrequest", foreign_key: "friend_id"

  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :game_users
  has_many :games, through: :game_users

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
