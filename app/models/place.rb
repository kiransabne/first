class Place < ActiveRecord::Base
	mount_uploader :placesvisited, PlacesvisitedUploader
	validates :name, :address, presence: true

	searchkick
	
	has_many :reviews, as: :reviewable, dependent: :destroy
	acts_as_votable

	geocoded_by :address

	after_validation :geocode, if: :address_changed?
	def slug
    	  name.downcase.gsub(" ", "-")  
  	end

  	def to_param
    	  "#{id}-#{slug}"
  	end

end
