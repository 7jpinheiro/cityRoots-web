class CommentEvent < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :event
end
