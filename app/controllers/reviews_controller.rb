class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)

    @review.restaurant_id = params[:restaurant_id]

    if @review.save
      flash[:notice] = 'Success'
      redirect_to restaurants_path(@review.restaurant_id)
    else
      flash[:notice] = 'You Fail'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
