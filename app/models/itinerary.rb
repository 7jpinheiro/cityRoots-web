# == Schema Information
#
# Table name: itineraries
#
#  id                :integer          not null, primary key
#  name              :string(100)      not null
#  description       :string(255)
#  itinerary_type_id :integer          not null
#  user_id           :integer          not null
#

class Itinerary < ActiveRecord::Base
	has_many :itinerary_attractions
	has_many :itinerary_events
	has_many :itinerary_services
	has_many :ratting_itineraries
	has_many :comment_itineraries
	belongs_to :itinerary_type
	belongs_to :user
end
