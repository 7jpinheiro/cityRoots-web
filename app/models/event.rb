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
  validates :rating, presence: false

  has_many :rating_events, dependent: :destroy
	has_many :comment_events, dependent: :destroy
	has_many :photo_events, dependent: :destroy
	has_many :itinerary_events, dependent: :destroy
  has_many :event_translations, dependent: :destroy
	has_many :event_types , dependent: :destroy
  has_many :types , :through => :event_types
	belongs_to :web_user
	belongs_to :city
  accepts_nested_attributes_for :event_types , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :event_translations , :reject_if => :all_blank, :allow_destroy => true
  #accepts_nested_attributes_for :photo_events , :allow_destroy => true


  def self.search(search,user)
    if search
      EventTranslation.where("name LIKE ?", "%#{search}%").collect {|et| et.event}
    else
      self.all
    end
  end

end
