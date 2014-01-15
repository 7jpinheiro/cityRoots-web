class EventTranslation < ActiveRecord::Base
  belongs_to :event
  belongs_to :language
end
