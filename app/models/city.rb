class City < ActiveRecord::Base
	belongs_to :country
	has_many :mobile_user_cities
	has_many :web_users
	has_many :events
	has_many :services
	has_many :attractions
end
