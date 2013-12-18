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
	has_many :itinerary_attractions, dependent: :destroy
	has_many :itinerary_events, dependent: :destroy
	has_many :itinerary_services, dependent: :destroy
	has_many :ratting_itineraries, dependent: :destroy
	has_many :comment_itineraries, dependent: :destroy
	belongs_to :itinerary_type
	belongs_to :user
end
