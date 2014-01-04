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

	belongs_to :attraction
	belongs_to :type

end
