# == Schema Information
#
# Table name: attractions
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  schedule           :string(255)
#  site               :string(100)
#  email              :string(100)
#  address            :string(255)
#  latitude           :float
#  longitude          :float
#  transport          :string(100)
#  active             :boolean          not null
#  timestamp          :integer          not null
#  reference_point    :boolean          not null
#  price              :string(255)
#  attraction_type_id :integer          not null
#  city_id            :integer          not null
#  web_user_id        :integer          not null
#

class Attraction < ActiveRecord::Base
  validates :name, :true ,length: {minimum: 2}
  validates :description, :true, length: {minimum: 2}
  validates :email, length: {minimum: 3}
  validates :site, length: {minimum: 2}
  validates :address, :true,length: {minimum: 5}
  validates :price, length: {minimum: 2}
  validates :latitude, presence:true
  validates :longitude, presence:true
	has_many :rating_attractions
	has_many :comment_attractions
	has_many :photo_attractions
	has_many :itenerary_attractions
	belongs_to :attraction_type
	belongs_to :web_user
	belongs_to :city

	accepts_nested_attributes_for :photo_attractions, :reject_if => lambda { |t| t['photo_attraction'].nil? }
end
