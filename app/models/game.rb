class Game < ApplicationRecord
  validates :title, :players, :age, :play_time, :complexity, :publisher, :description, presence: true
end
