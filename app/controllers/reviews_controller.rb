class ReviewsController < ApplicationController
  def create
    p params
    @review = Review.new(review_params)
    @review.game_id = params[:game_id]
    @review.user = current_user
    if @review.save
      redirect_to games_path
    else
      # This must be changed
      redirect_to games_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :game)
  end
end
