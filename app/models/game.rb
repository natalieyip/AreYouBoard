class Game < ApplicationRecord
  has_many :game_tags
  has_many :tags, through: :game_tags
  has_many :reviews
  has_many :votes, as: :voteable
  has_many :game_users
  has_many :users, through: :game_users

  validates :title, :players, :age, :play_time, :complexity, :publisher, :description, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.clker.com/cliparts/b/S/4/T/8/W/image-missing-md.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :avatar, attachment_presence: true

  def game_in_collection?(user)
    GameUser.where(game: self, user: user).length > 0
  end

  def self.get_a_users_games(user)
    friends = user.friends
    games = []
    friends.each do |friend|
      games + friend.games
    end
    games + user.games
  end

end
