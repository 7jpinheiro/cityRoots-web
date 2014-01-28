# == Schema Information
#
# Table name: comment_itineraries
#
#  id             :integer          not null, primary key
#  comment        :string(500)      not null
#  evaluationdate :date             not null
#  itinerary_id   :integer          not null
#  mobile_user_id :integer          not null
#

class CommentItinerary < ActiveRecord::Base
  validates :comment, presence:true
  validates :evaluationdate, presence:true
  validates :itinerary_id, presence:true

	belongs_to :mobile_user
  belongs_to :itinerary
end
