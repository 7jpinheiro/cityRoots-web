# == Schema Information
#
# Table name: photo_events
#
#  id          :integer          not null, primary key
#  url         :string(500)      not null
#  name        :string(100)
#  description :string(255)
#  extension   :string(10)
#  event_id    :integer          not null
#

class PhotoEvent < ActiveRecord::Base
	belongs_to :event
end
