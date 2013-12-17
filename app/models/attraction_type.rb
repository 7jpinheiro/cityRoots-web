  # == Schema Information
#
# Table name: attraction_types
#
#  id                      :integer          not null, primary key
#  name                    :string(100)      not null
#  description             :string(255)
#  attraction_big_types_id :integer          not null
#

class AttractionType < ActiveRecord::Base
  validates :name, presence:true
	belongs_to :attraction_big_type
	has_many :attractions
end
