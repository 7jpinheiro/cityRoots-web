class CommentsItinerary < ActiveRecord::Base
	belongs_to :mobile_user
	belongs_to :itinerary
end
