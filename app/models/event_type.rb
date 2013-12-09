class EventType < ActiveRecord::Base
	has_many :local_events
end
