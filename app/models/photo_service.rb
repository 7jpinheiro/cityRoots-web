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
  validates :url, presence:true
  validates :service_id, presence:true
	belongs_to :service
end
