class Game < ApplicationRecord
  has_many :game_tags
  has_many :tags, through: :game_tags
  has_many :reviews
  validates :title, :players, :age, :play_time, :complexity, :publisher, :description, presence: true
end
