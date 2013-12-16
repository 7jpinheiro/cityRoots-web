# == Schema Information
#
# Table name: comment_attractions
#
#  id             :integer          not null, primary key
#  comment        :text             not null
#  evaluationdate :date             not null
#  mobile_user_id :integer          not null
#  attraction_id  :integer          not null
#

class CommentAttraction < ActiveRecord::Base
    validates :comment, presence:true
    validates :evaluationdate, presence:true
    validates :attraction_id, presence:true
	  belongs_to :mobile_user
    belongs_to :attraction
end
