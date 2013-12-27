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

	belongs_to :itinerary
	belongs_to :service
end
