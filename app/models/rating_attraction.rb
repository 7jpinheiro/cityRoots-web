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
    belongs_to :mobile_user
    belongs_to :attraction
end
