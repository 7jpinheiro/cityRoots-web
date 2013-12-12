class MobileUserCity < ActiveRecord::Base
	belongs_to :city 
	belongs_to :mobile_user
end
