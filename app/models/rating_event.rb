# == Schema Information
#
# Table name: rating_events
#
#  id             :integer          not null, primary key
#  rating         :integer          not null
#  evaluationdate :date             not null
#  mobile_user_id :integer          not null
#  event_id       :integer          not null
#

class RatingEvent < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :event
end
