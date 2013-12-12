class RatingEvent < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :event
end
