class RestaurantimagesController < ApplicationController
  before_action :set_restaurant

  def create
    add_more_restaurantimages(restaurantimages_params[:restaurantimages])
    flash[:error] = "Failed uploading Restaurant images" unless @restaurant.save
    redirect_to :back
  end

  def destroy
    remove_restaurantimage_at_index(params[:id].to_i)
    flash[:error] = "failed deleting image" unless @restaurant.save
    redirect_to :back
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def add_more_restaurantimages(new_restaurantimages)
    restaurantimages = @restaurant.restaurantimages # copy the old images 
    restaurantimages += new_restaurantimages # concat old images with new ones
    @restaurant.restaurantimages = restaurantimages # assign back
  end

  def remove_restaurantimage_at_index(index)
    remain_restaurantimages = @restaurant.restaurantimages
    deleted_restaurantimage = remain_restaurantimages.delete_at(index)
    deleted_restaurantimage.try(:remove!)
    @restaurant.restaurantimages = remain_restaurantimages
  end

  def restaurantimages_params
    params.require(:restaurant).permit({restaurantimages: []}) # allow nested params as array
  end
end
