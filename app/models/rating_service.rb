# == Schema Information
#
# Table name: rating_services
#
#  id             :integer          not null, primary key
#  rating         :integer          not null
#  evaluationdate :date             not null
#  mobile_user_id :integer          not null
#  service_id     :integer          not null
#

class RatingService < ActiveRecord::Base
  validates :rating, presence:true
  validates :evaluationdate, presence:true
  validates :mobile_user_id, presence:true
  validates :service_id, presence:true
	belongs_to :mobile_user
    belongs_to :service
end
