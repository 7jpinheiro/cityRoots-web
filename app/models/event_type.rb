# == Schema Information
#
# Table name: event_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class EventType < ActiveRecord::Base
	has_many :events
end
