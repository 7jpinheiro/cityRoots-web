# == Schema Information
#
# Table name: photo_attractions
#
#  id            :integer          not null, primary key
#  url           :string(500)      not null
#  name          :string(100)
#  description   :string(255)
#  extension     :string(10)
#  attraction_id :integer          not null
#

class PhotoAttraction < ActiveRecord::Base
	belongs_to :attraction
end
