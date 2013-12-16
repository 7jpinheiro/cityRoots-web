# == Schema Information
#
# Table name: rating_attractions
#
#  id             :integer          not null, primary key
#  rating         :integer          not null
#  evaluationdate :date             not null
#  mobile_user_id :integer          not null
#  attraction_id  :integer          not null
#

class RatingAttraction < ActiveRecord::Base
    validates :rating, presence:true
    validates :evaluationdate, presence:true
    validates :mobile_user_id, presence:true
    validates :attraction_id, presence:true
    belongs_to :mobile_user
    belongs_to :attraction
end
