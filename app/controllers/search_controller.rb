class SearchController < ApplicationController
	 def index
	 	if params[:q].present?
	 		if params[:section] == "all"
	 				@results = { restaurants: Restaurant, street_foods: StreetFood, places: Place, touristspots: Touristspot }
	 			elsif params[:section] == "restaurant"
	 				@restaurants = Restaurant.search params[:q]
	 			elsif params[:section] == "street_food"
	 				@street_foods = StreetFood.search params[:q]
	 			elsif params[:section] == "place"
	 				@places = Place.search params[:q]
				elsif params[:section] == "touristspot"
					@touristspots = Touristspot.search params[:q]
				elsif params[:section] == "bar"
					@bars = Bar.search params[:q]

	 		end
	 	end
	 end
end
