class GameUser < ApplicationRecord
  belongs_to :user
  belongs_to :game


  def self.games(user)
    @games = []
    @game_users = GameUser.where(user_id: user.id)
    @game_users.each do |game_user_obj|
      @games << game_user_obj.game
    end
    @games
  end
end
