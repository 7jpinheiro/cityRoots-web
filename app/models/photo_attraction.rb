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
  validates :url, presence:true
  validates :attraction_id, presence:true
	belongs_to :attraction

  	#
  	## Validations
  	#
  	validates :name, :presence => true, :length => { :minimum => 1, :maximum => 100 }
  	validates :description, :presence => true, :length => { :maximum => 250 }

	has_attached_file :photo, :styles => { :medium => "250x250#", :thumb => "50x50#" }

end
