class CommentService < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :service
end
