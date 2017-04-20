class VotesController < ApplicationController

	def new
		@game = Game.find(params[:game_id])
	end 

	def create
	end 
end
