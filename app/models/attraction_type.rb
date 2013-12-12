class AttractionType < ActiveRecord::Base
	belongs_to :attraction_big_type
	has_many :attractions
end
