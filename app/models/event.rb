# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :string(100)      not null
#  description   :text
#  schedule      :string(255)
#  site          :string(100)
#  email         :string(100)
#  address       :string(255)
#  latitude      :float
#  longitude     :float
#  transport     :string(100)
#  active        :boolean          not null
#  timestamp     :integer          not null
#  startdate     :date             not null
#  enddate       :date             not null
#  organization  :string(100)
#  price         :string(255)      not null
#  program       :string(500)
#  event_type_id :integer          not null
#  city_id       :integer          not null
#  web_user_id   :integer          not null
#

class Event < ActiveRecord::Base
  validates :site, presence: false
  validates :email, presence: true , length: {minimum: 2}
  validates :address, presence: true, length: {minimum: 5}
  validates :latitude, presence:false
  validates :longitude, presence:false
  validates :startdate, presence:true
  validates :enddate, presence:true
  validates :organization , presence: false
  validates :price , presence: false
  validates :program, presence:true ,length: {minimum: 2}
  validates :rating, presence:true, length: {minimum: 5}




  has_many :rating_events, dependent: :destroy
	has_many :comment_events, dependent: :destroy
	has_many :photo_events, dependent: :destroy
	has_many :itinerary_events, dependent: :destroy
  has_many :event_translations, dependent: :destroy
	belongs_to :event_type
	belongs_to :web_user
	belongs_to :city
  accepts_nested_attributes_for :event_translations
  accepts_nested_attributes_for :photo_events, :reject_if => lambda { |t| t['photo_event'].nil? }, :allow_destroy => true
end
