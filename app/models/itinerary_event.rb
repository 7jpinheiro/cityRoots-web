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
  validates :order, presence:true, length: {minimum: 2}
  validates :itinerary_id, presence:true
  validates :event_id, presence:true
	belongs_to :itenerary
	belongs_to :event
end
