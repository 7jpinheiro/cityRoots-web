class RatingService < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :service
end
