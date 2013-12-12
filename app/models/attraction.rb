class Attraction < ActiveRecord::Base
	has_many :rating_attraction
	has_many :comment_attraction
	has_many :photo_attraction
	has_many :itenerary_attraction
	belongs_to :attraction_type
	belongs_to :web_user
	belongs_to :city
end
