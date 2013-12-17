# == Schema Information
#
# Table name: comment_events
#
#  id             :integer          not null, primary key
#  comment        :text             not null
#  evaluationdate :date             not null
#  mobile_user_id :integer          not null
#  event_id       :integer          not null
#

class CommentEvent < ActiveRecord::Base
    validates :comment, presence:true
    validates :evaluationdate, presence:true
    validates :event_id, presence:true
    belongs_to :mobile_user
    belongs_to :event
end
