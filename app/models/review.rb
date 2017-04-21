class Review < ApplicationRecord
  belongs_to :game
  validates :user, :game, :body, :title, presence: true
end
