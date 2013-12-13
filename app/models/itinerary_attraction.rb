# == Schema Information
#
# Table name: itinerary_attractions
#
#  id            :integer          not null, primary key
#  order         :integer          not null
#  itinerary_id  :integer          not null
#  attraction_id :integer          not null
#

class ItineraryAttraction < ActiveRecord::Base
	belongs_to :itenerary
	belongs_to :attraction
end
