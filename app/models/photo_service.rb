# == Schema Information
#
# Table name: photo_services
#
#  id          :integer          not null, primary key
#  url         :string(500)      not null
#  name        :string(100)
#  description :string(255)
#  extension   :string(10)
#  service_id  :integer          not null
#

class PhotoService < ActiveRecord::Base
  validates :service_id, presence:true
	belongs_to :service
  has_attached_file :photo, :styles => { :medium => "3000x3000#", :small => "200x200>", :thumb => "50x50#" }, default_url: "/images/:style/missing.png"

end
