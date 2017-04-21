class ReviewsController < ApplicationController
  def create
    p params
    @review = Review.new(review_params)
    p @review
    @review.game_id = params[:game_id]
    @review.user_id = current_user.id
    p @review
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
