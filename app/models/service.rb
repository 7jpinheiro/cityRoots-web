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

  validates :site, length: {minimum: 2}
  validates :email, length: {minimum: 3}
  validates :address, presence:true,length: {minimum: 5}
  validates :latitude, presence:false
  validates :longitude, presence:false
  validates :capacity, presence:true
  validates :details, presence:true

  belongs_to :web_user
  belongs_to :city

  has_many :service_types, dependent: :destroy
  has_many :service_translations , dependent: :destroy
  has_many :rating_services, dependent: :destroy
	has_many :comment_services, dependent: :destroy
	has_many :photo_services, dependent: :destroy
	has_many :itinerary_services, dependent: :destroy
  has_many :types, :through=> :service_types

  accepts_nested_attributes_for :service_types , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :service_translations , :reject_if => :all_blank, :allow_destroy => true

end
