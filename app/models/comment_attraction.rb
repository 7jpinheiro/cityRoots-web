class CommentAttraction < ActiveRecord::Base
	belongs_to :mobile_user
    belongs_to :attraction
end
