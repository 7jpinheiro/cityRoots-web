class Type < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :attraction_type
  belongs_to :service_type
end
