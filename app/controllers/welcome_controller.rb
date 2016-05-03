class WelcomeController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  layout "welcome_page"

  def index
    @restaurants = Restaurant.all
	@places = Place.all
	@touristspots = Touristspot.all
	@street_foods = StreetFood.all
  end
end
