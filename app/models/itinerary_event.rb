# == Schema Information
#
# Table name: itinerary_events
#
#  id           :integer          not null, primary key
#  order        :integer          not null
#  itinerary_id :integer          not null
#  event_id     :integer          not null
#

class ItineraryEvent < ActiveRecord::Base

	belongs_to :itinerary
	belongs_to :event
end
