class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @reviews = @city.reviews.order("num_of_reviews DESC").limit(15)
  end
end
