class VotesController < ApplicationController

	def upvote
		@vote = Vote.find_by(voteable_type: :game, voteable_id: params[:game_id], user_id: current_user.id)
		if @vote  
			@vote.value += 1
		else 
			@vote = Vote.new(voteable_type: :game, voteable_id: params[:game_id], user_id: current_user.id, value: 1 )
		end 
	end

	def downvote
	end 
end
