# == Schema Information
#
# Table name: mobile_users
#
#  id          :integer          not null, primary key
#  firstname   :string(100)
#  surname     :string(100)
#  gender      :string(1)
#  dateofbirth :date
#  active      :boolean          not null
#

class MobileUser < ActiveRecord::Base
	belongs_to :user 
	has_many :comments_events
	has_many :comments_services
	has_many :comments_attractions
	has_many :comments_itineraries
	has_many :rating_events
	has_many :rating_services
	has_many :rating_attractions
	has_many :rating_itineraries
end
