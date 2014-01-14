# == Schema Information
#
# Table name: itineraries
#
#  id                :integer          not null, primary key
#  name              :string(100)      not null
#  description       :string(255)
#  itinerary_type_id :integer          not null
#  user_id           :integer          not null
#

class Itinerary < ActiveRecord::Base

  validates :name, presence:true
  validates :description, presence:true

  belongs_to :itinerary_type
  belongs_to :user

  has_many :rating_itineraries, dependent: :destroy
  has_many :comment_itineraries, dependent: :destroy
	has_many :itinerary_attractions, dependent: :destroy
	has_many :itinerary_events, dependent: :destroy
	has_many :itinerary_services, dependent: :destroy

  accepts_nested_attributes_for :itinerary_attractions , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :itinerary_events , :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :itinerary_services , :reject_if => :all_blank, :allow_destroy => true



  def self.search(search)
    puts search
    if search
      puts 'ola mndo'
      self.where("name LIKE ?", "%#{search}%")
    else
      puts 'oooooooo'
      self.all
    end
  end


end
