class ReviewsController < ApplicationController



  private

  def review_params
    params.require(:review).permit(:title, :link, :num_of_reviews, :review_average)
  end
end
