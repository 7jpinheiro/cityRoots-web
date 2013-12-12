class ItineraryAttraction < ActiveRecord::Base
	belongs_to :itenerary
	belongs_to :attraction
end
