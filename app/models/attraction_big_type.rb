# == Schema Information
#
# Table name: attraction_big_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class AttractionBigType < ActiveRecord::Base
  validate :name, presence:true
	has_many :attraction_types
end
