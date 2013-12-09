class LocalEvent < ActiveRecord::Base
	belongs_to :local
	belongs_to :event_type
end
