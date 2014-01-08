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
  validates :site, length: {minimum: 2}
  validates :email, length: {minimum: 3}
  validates :phone, presence: :true
  validates :address, presence:true,length: {minimum: 5}
  validates :latitude, presence:true
  validates :longitude, presence:true

  belongs_to :web_user
  belongs_to :city

  has_many :rating_attractions, dependent: :destroy
	has_many :comment_attractions, dependent: :destroy
	has_many :photo_attractions, dependent: :destroy
	has_many :itinerary_attractions, dependent: :destroy
  has_many :attraction_types , dependent: :destroy
  has_many :attraction_translations , dependent: :destroy
  has_many :types , :through => :attraction_types

  accepts_nested_attributes_for :attraction_types , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :attraction_translations , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :photo_attractions, :reject_if => lambda { |t| t['photo_attraction'].nil? }, :allow_destroy => true

end
