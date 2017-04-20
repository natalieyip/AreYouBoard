class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_friendrequests, class_name: "Friendrequest", foreign_key: "sender_id"
  has_many :received_friendrequests, class_name: "Friendrequest", foreign_key: "friend_id"
  has_many :friendships
  has_many :friends, through: :friendships, source: :user
end
