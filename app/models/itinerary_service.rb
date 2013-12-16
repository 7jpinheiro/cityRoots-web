# == Schema Information
#
# Table name: itinerary_services
#
#  id           :integer          not null, primary key
#  order        :integer          not null
#  itinerary_id :integer          not null
#  service_id   :integer          not null
#

class ItineraryService < ActiveRecord::Base
  validates :order, presence:true, length: {minimum: 2}
  validates :itinerary_id, presence:true
  validates :service_id, presence:true
	belongs_to :itenerary
	belongs_to :service
end
