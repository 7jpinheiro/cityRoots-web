class Event < ActiveRecord::Base
	has_many :rating_events
	has_many :comment_events
	has_many :photo_events
	has_many :itenerary_events
	belongs_to :event_type
	belongs_to :web_user
	belongs_to :city
end
