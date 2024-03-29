# == Schema Information
#
# Table name: photo_attractions
#
#  id                 :integer          not null, primary key
#  name               :string(100)
#  photo_file_name    :string(100)      not null
#  photo_content_type :string(100)
#  photo_file_size    :integer
#  photo_updated_at   :date
#  description        :string(255)
#  attraction_id      :integer          not null
#

class PhotoAttraction < ActiveRecord::Base
  	validates :attraction_id, presence:true
	  belongs_to :attraction

  	#
  	## Validations
  	#
  	#validates :name, :presence => true, :length => { :minimum => 1, :maximum => 100 }
  	#validates :description, :presence => true, :length => { :maximum => 250 }

    has_attached_file :photo, :styles => { :medium => "1200x350#", :small => "300x300#", :thumb => "50x50#" }, default_url: "/images/missing.png"

end
