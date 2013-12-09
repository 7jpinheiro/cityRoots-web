class CommentsLocal < ActiveRecord::Base
	belongs_to :mobile_user
	belongs_to :local
end
