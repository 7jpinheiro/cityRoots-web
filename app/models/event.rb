# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  site          :string(255)
#  email         :string(255)
#  address       :string(255)
#  phone         :string(30)
#  latitude      :float
#  longitude     :float
#  source        :text
#  active        :boolean          default(TRUE), not null
#  timestamp     :integer          not null
#  startdate     :date
#  enddate       :date
#  organization  :string(100)
#  rating        :float            default(0.0), not null
#  accessibility :boolean          default(FALSE), not null
#  city_id       :integer          not null
#  web_user_id   :integer          not null
#

class Event < ActiveRecord::Base
#  validates :site, presence: false
#  validates :email, presence: true , length: {minimum: 2}
#  validates :address, presence: true, length: {minimum: 5}
#  validates :latitude, presence:false
#  validates :longitude, presence:false
#  validates :startdate, presence:true
#  validates :enddate, presence:true
#  validates :organization , presence: false
#  validates :rating, presence: false

  has_many :rating_events, dependent: :destroy
	has_many :comment_events, dependent: :destroy
	has_many :photo_events, dependent: :destroy
	has_many :itinerary_events, dependent: :destroy
  has_many :event_translations, dependent: :destroy
	has_many :event_types , dependent: :destroy
  has_many :types , :through => :event_types
  has_many :languages , :through => :event_translations
	belongs_to :web_user
	belongs_to :city
  accepts_nested_attributes_for :event_types , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :event_translations , :reject_if => :all_blank, :allow_destroy => true

end
