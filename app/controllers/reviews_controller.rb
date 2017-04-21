class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review

    else

    end
  end

  private
  def review_params
    params.require(:new_review).permit(:title, :body)
  end
end
