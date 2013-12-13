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
	belongs_to :mobile_user
    belongs_to :service
end
