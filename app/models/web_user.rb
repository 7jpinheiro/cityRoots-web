class WebUser < ActiveRecord::Base
	has_many :services
	has_many :events
	has_many :attractions
    belongs_to :city
    belongs_to :web_users_type
end
