class WelcomeController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  layout "welcome_page"

  def index
	visitor_latitude = request.location.latitude
	visitor_longitude = request.location.longitude
	@restaurants = Restaurant.near([visitor_latitude, visitor_longitude], 50, :limit => 5)
	@places = Place.near([visitor_latitude, visitor_longitude], 50, :limit => 5)
	@touristspots = Touristspot.all
	@street_foods = StreetFood.near([visitor_latitude, visitor_longitude], 50, :limit => 5)
	@bars = Bar.near([visitor_latitude, visitor_longitude], 50, :limit => 5)
	@pubs = Pub.near([visitor_latitude, visitor_longitude], 10, :limit => 5)
  end

  def show
	@restaurant = Restaurant.find(params[:id])
	@place = Place.find(params[:id])
	@street_food = StreetFood.find(params[:id])
	@bar = Bar.find(params[:id])
	@pub = Pub.find(params[:id])
  end
end
