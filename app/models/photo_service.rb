# == Schema Information
#
# Table name: photo_services
#
#  id                  :integer          not null, primary key
#  name                :string(100)
#  photo_file_name     :string(100)      not null
#  photo_content_type  :string(100)
#  photo_file_size     :integer
#  photo_updated_at    :date
#  description         :string(255)
#  service_id          :integer          not null
#

class PhotoService < ActiveRecord::Base
  validates :service_id, presence:true
	belongs_to :service
  has_attached_file :photo, :styles => { :medium => "3000x3000#", :small => "200x200>", :thumb => "50x50#" }, default_url: "/images/:style/missing.png"

end
