# == Schema Information
#
# Table name: comment_services
#
#  id             :integer          not null, primary key
#  comment        :text             not null
#  evaluationdate :date             not null
#  mobile_user_id :integer          not null
#  service_id     :integer          not null
#

class CommentService < ActiveRecord::Base
  validates :comment, presence:true
  validates :evaluationdate, presence:true
  validates :service_id, prescene:true
	belongs_to :mobile_user
    belongs_to :service
end
