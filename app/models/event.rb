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
	has_many :rating_events
	has_many :comment_events
	has_many :photo_events
	has_many :itenerary_events
	belongs_to :event_type
	belongs_to :web_user
	belongs_to :city
end
