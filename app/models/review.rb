class Review < ApplicationRecord
  belongs_to :game
  has_many :votes, as: :voteable
  validates :user_id, :game_id, :body, :title, presence: true
end
