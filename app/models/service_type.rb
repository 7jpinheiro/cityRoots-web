# == Schema Information
#
# Table name: service_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class ServiceType < ActiveRecord::Base
  validates :name, presence:true
	has_many :services
end
