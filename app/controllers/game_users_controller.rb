class GameUsersController < ApplicationController
  def create
    @game_user = GameUser.new()
    @game_user.game_id = params[:game_id]
    @game_user.user_id = current_user.id

    if @game_user.save
      redirect_to game_path(@game_user.game_id)
    else

    end
  end

end
