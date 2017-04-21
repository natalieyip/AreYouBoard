class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.game_id = params[:game_id]
    @review.user_id = current_user.id
    p @review
    if @review.save
      redirect_to game_path(params[:game_id])
    else
      # This must be changed
      redirect_to game_path(params[:game_id])
    end
  end

  # def upvote
  #   @review = Game.find(params[:game_id])
  #   @vote = Vote.find_by(voteable: @game, user_id: current_user.id)
  #   if @vote
  #     @vote.increase
  #     @vote.save
  #     redirect_to @game
  #   else
  #     @vote = Vote.new(voteable: @game, user_id: current_user.id, value: 1 )
  #     @vote.save
  #     redirect_to @game
  #   end
  # end

  # def downvote
  #   @game = Game.find(params[:game_id])
  #   @vote = Vote.find_by(voteable: @game, user_id: current_user.id)
  #   if @vote
  #     @vote.decrease
  #     @vote.save
  #     redirect_to @game
  #   else
  #     @vote = Vote.new(voteable: @game, user_id: current_user.id, value: 1 )
  #     @vote.save
  #     redirect_to @game
  #   end
  # end

  private
  def review_params
    params.require(:review).permit(:title, :body, :game)
  end
end
