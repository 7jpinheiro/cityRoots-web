class ItineraryEvent < ActiveRecord::Base
	belongs_to :itenerary
	belongs_to :event
end
