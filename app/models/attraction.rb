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
	has_many :rating_attractions
	has_many :comment_attractions
	has_many :photo_attractions
	has_many :itenerary_attractions
	belongs_to :attraction_type
	belongs_to :web_user
	belongs_to :city
end
