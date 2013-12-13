# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(100)      not null
#  abv        :string(10)       not null
#  country_id :integer          not null
#

class City < ActiveRecord::Base
	belongs_to :country
	has_many :mobile_user_cities
	has_many :web_users
	has_many :events
	has_many :services
	has_many :attractions
end
