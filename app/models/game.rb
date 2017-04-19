class Game < ApplicationRecord
  validates :title, :players, :age, :play_time, :complexity, :publisher, :img_url, :description, presence: true
end
