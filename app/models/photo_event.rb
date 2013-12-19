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
  validates :url, presence:true
	belongs_to :event
	has_attached_file :photo, :styles => { :medium => "250x250#", :thumb => "50x50#" }
end
