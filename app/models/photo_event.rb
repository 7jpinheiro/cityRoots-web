# == Schema Information
#
# Table name: photo_events
#
#  id                 :integer          not null, primary key
#  name               :string(100)
#  photo_file_name    :string(100)      not null
#  photo_content_type :string(100)
#  photo_file_size    :integer
#  photo_updated_at   :date
#  description        :string(255)
#  event_id           :integer          not null
#

class PhotoEvent < ActiveRecord::Base
  	validates :event_id, presence:true
	belongs_to :event
    has_attached_file :photo, :styles => { :medium => "1200x350#", :small => "300x300#", :thumb => "50x50#" }, default_url: "/images/missing.png"

end
