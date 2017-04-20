class UsersController < ApplicationController
	before_action :authenticate_user!

	# user_signed_in? 

	# current_user

	# user_session 

	def show
		@user = User.find(current_user.id)
	end 


end 