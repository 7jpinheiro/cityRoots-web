# == Schema Information
#
# Table name: services
#
#  id              :integer          not null, primary key
#  name            :string(100)      not null
#  description     :text
#  schedule        :string(255)
#  site            :string(100)
#  email           :string(100)
#  address         :string(255)
#  latitude        :float
#  longitude       :float
#  transport       :string(100)
#  active          :boolean          not null
#  timestamp       :integer          not null
#  reference_point :boolean          not null
#  capacity        :integer
#  details         :string(255)
#  service_type_id :integer          not null
#  web_user_id     :integer          not null
#  city_id         :integer          not null
#

class Service < ActiveRecord::Base
	has_many :rating_services
	has_many :comment_services
	has_many :photo_services
	has_many :itenerary_services
	belongs_to :service_type
	belongs_to :web_user
	belongs_to :city
end
