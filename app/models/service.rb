class Service < ActiveRecord::Base
	has_many :rating_services
	has_many :comment_services
	has_many :photo_services
	has_many :itenerary_services
	belongs_to :service_type
	belongs_to :web_user
	belongs_to :city
end
