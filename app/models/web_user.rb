class WebUser < ActiveRecord::Base
	has_many :locals
	has_many :web_users_packs
	belongs_to :web_users_type
end
