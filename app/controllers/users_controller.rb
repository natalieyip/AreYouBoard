class UsersController < ApplicationController
	before_action :authenticate_user!

#helper functions Devise gives us: user_signed_in?, current_user, user_session 

	def show
		@user = User.find(params[:id])
		@games = Game.all
	end 


end 