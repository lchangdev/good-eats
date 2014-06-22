class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Successful."
      redirect_to restaurants_path
    else
      flash[:notice] = "Please try again."
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where("restaurant_id = ?", params[:id])
  end

  def ten_most_recent
    @restaurants = Restaurant.order(created_at: :desc).limit(10)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip_code, :description, :category)
  end

end
