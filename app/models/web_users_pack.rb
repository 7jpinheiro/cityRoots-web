class WebUsersPack < ActiveRecord::Base
	belongs_to :pack_type
	belongs_to :web_user
end
