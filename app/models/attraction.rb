class Attraction < ActiveRecord::Base
	has_many :rating_attractions
	has_many :comment_attractions
	has_many :photo_attractions
	has_many :itenerary_attractions
	belongs_to :attraction_type
	belongs_to :web_user
	belongs_to :city
end
