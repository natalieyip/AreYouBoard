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

  def upvote
    @review = Review.find(params[:review_id])
    @vote = Vote.find_by(voteable: @review, user_id: current_user.id)
    if @vote
      @vote.increase
      @vote.save
      redirect_to game_path(@review.game_id)
    else
      @vote = Vote.new(voteable: @review, user_id: current_user.id, value: 1 )
      @vote.save
      redirect_to game_path(@review.game_id)
    end
  end

  def downvote
    @review = Review.find(params[:review_id])
    @vote = Vote.find_by(voteable: @review, user_id: current_user.id)
    if @vote
      @vote.decrease
      @vote.save
      redirect_to game_path(@review.game_id)
    else
      @vote = Vote.new(voteable: @review, user_id: current_user.id, value: 1 )
      @vote.save
      redirect_to game_path(@review.game_id)
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :game)
  end
end
