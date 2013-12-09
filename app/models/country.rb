class Country < ActiveRecord::Base
	has_many :cities
	has_many :mobile_users
end
