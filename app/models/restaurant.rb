class Restaurant < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews, as: :reviewable, dependent: :destroy

	validates :name, :address, presence: true

	acts_as_votable
	geocoded_by :the_address
	def the_address
	"#{address} #{city} #{state} #{zipcode}"
	end

	after_validation :geocode, if: :address_changed?
end
