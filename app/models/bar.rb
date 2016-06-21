class Bar < ActiveRecord::Base

	mount_uploader :bar, BarUploader

	searchkick

	has_many :reviews, as: :reviewable, dependent: :destroy

	validates :name, :address, presence: true

	acts_as_votable
	geocoded_by :the_address
	def the_address
	"#{address} #{zipcode}"
	end

	after_validation :geocode, if: :address_changed?

#	def slug
 #   	  name.downcase.gsub(" ", "-")  
  #	end

  #	def to_param
   # 	  "#{id}-#{slug}"
  #	end

end
