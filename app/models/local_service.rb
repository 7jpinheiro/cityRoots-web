class LocalService < ActiveRecord::Base
	belongs_to :local
	belongs_to :service_type
end
