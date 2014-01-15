# == Schema Information
#
# Table name: event_types
#
#  id       :integer          not null, primary key
#  event_id :integer          not null
#  type_id  :integer          not null
#

class EventType < ActiveRecord::Base
	belongs_to :event
  belongs_to :type
end
