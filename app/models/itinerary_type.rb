# == Schema Information
#
# Table name: itinerary_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class ItineraryType < ActiveRecord::Base
	belongs_to :itenerary
end
