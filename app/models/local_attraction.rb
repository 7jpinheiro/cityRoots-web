class LocalAttraction < ActiveRecord::Base
	belongs_to :local, :foreign_key => :id
	belongs_to :attraction_type, :foreign_key => :attraction_type
end
