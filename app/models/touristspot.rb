class Touristspot < ActiveRecord::Base
	mount_uploader :tourist, TouristUploader
	searchkick
	has_many :reviews, as: :reviewable, dependent: :destroy
	validates :name, :location, presence: true
	acts_as_votable



end
