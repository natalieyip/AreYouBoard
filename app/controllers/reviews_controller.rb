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

  private
  def review_params
    params.require(:review).permit(:title, :body, :game)
  end
end
