# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  abv         :string(10)       not null
#  description :text
#  country_id  :integer          not null
#

class City < ActiveRecord::Base
  validates :name, presence:true
  validates :abv, presence:true
  validates :country_id, presence:true
	belongs_to :country, dependent: :destroy
	has_many :mobile_user_cities, dependent: :destroy
	has_many :web_users, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :services, dependent: :destroy
	has_many :attractions, dependent: :destroy
end
