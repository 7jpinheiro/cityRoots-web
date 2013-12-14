# == Schema Information
#
# Table name: rating_itineraries
#
#  id             :integer          not null, primary key
#  rating         :integer          not null
#  evaluationdate :date             not null
#  itinerary_id   :integer          not null
#  mobile_user_id :integer          not null
#

class RatingItinerary < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :event
end
