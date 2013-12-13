# == Schema Information
#
# Table name: mobile_user_cities
#
#  id             :integer          not null, primary key
#  city_id        :integer          not null
#  mobile_user_id :integer          not null
#

class MobileUserCity < ActiveRecord::Base
	belongs_to :city 
	belongs_to :mobile_user
end
