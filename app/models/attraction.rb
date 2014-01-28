# == Schema Information
#
# Table name: attractions
#
#  id              :integer          not null, primary key
#  site            :string(255)
#  email           :string(255)
#  address         :string(255)
#  phone           :string(30)
#  latitude        :float
#  longitude       :float
#  active          :boolean          default(TRUE), not null
#  source          :text
#  timestamp       :integer          not null
#  reference_point :boolean          not null
#  rating          :float            default(0.0), not null
#  accessibility   :boolean          default(FALSE), not null
#  city_id         :integer          not null
#  web_user_id     :integer          not null
#

class Attraction < ActiveRecord::Base
#  validates :site
#  validates :email, length: {minimum: 3}
#  validates :phone, presence: :true
#  validates :address, presence:true,length: {minimum: 5}
#  validates :latitude, presence:true
#  validates :longitude, presence:true

  belongs_to :web_user
  belongs_to :city

  has_many :rating_attractions, dependent: :destroy
	has_many :comment_attractions, dependent: :destroy
	has_many :photo_attractions, dependent: :destroy
	has_many :itinerary_attractions, dependent: :destroy
  has_many :attraction_types , dependent: :destroy
  has_many :attraction_translations , dependent: :destroy
  has_many :types , :through => :attraction_types
  has_many :languages , :through => :attraction_translations

  accepts_nested_attributes_for :attraction_types , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :attraction_translations , :reject_if => :all_blank, :allow_destroy => true
  #accepts_nested_attributes_for :photo_attractions, :reject_if => lambda { |t| t['photo_attraction'].nil? }, :allow_destroy => true



  def self.search(search,user)
    if search
      Attraction.joins(:attraction_translations).where("attractions.web_user_id=? and LOWER(attraction_translations.name) LIKE LOWER(?)", user.id,"%#{search}%").distinct
    else
      self.all
    end
  end

end
