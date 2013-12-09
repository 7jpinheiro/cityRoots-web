class Itinerary < ActiveRecord::Base
	has_many :comments_itineraries
	has_many :rating_itineraries
end
