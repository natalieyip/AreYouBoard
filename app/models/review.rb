class Review < ApplicationRecord
  belongs_to :game
  validates :user_id, :game_id, :body, :title, presence: true
end
