class WelcomeController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  layout "welcome_page"

  def index
	visitor_latitude = request.location.latitude
	visitor_longitude = request.location.longitude
	@restaurants = Restaurant.near([visitor_latitude, visitor_longitude], 50, :limit => 5)
	@places = Place.all
	@touristspots = Touristspot.all
	@street_foods = StreetFood.all
  end

  def show
	@restaurant = Restaurant.find(params[:id])
  end
end
