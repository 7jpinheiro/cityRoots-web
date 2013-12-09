class Local < ActiveRecord::Base
	has_many :comments_locals
	has_many :rating_locals  
	has_one :local_attraction, :foreign_key => :id  
end
