class MobileUser < ActiveRecord::Base
	belongs_to :user 
	has_many :comments_events
	has_many :comments_services
	has_many :comments_attractions
	has_many :comments_itineraries
	has_many :rating_events
	has_many :rating_services
	has_many :rating_attractions
	has_many :rating_itineraries
end
