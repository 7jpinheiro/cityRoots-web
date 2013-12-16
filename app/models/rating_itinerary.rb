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
  validates :rating, presence:true
  validates :evaluationdate, presence:true
  validates :mobile_user_id, presence:true
  validates :itinerary_id, presence:true
	belongs_to :mobile_user
    belongs_to :event
end
