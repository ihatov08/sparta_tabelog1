class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review= Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      redirect_to @review.restaurant
    else
      render :new
    end
  end

 private
 def review_params
  params.require(:review).permit(
    :body,
    :rate)
end

end

