class MobileUser < ActiveRecord::Base
	has_many :rating_itineraries
	has_many :comments_itineraries
	has_many :comments_locals
	has_many :rating_locals
	belongs_to :language
	belongs_to :country
end
