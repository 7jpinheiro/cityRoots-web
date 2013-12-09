class RatingItinerary < ActiveRecord::Base
	belongs_to :itinerary
	belongs_to :mobile_user
end
