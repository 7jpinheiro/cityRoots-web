# == Schema Information
#
# Table name: countries
#
#  id   :integer          not null, primary key
#  name :string(100)      not null
#  abv  :string(10)       not null
#

class Country < ActiveRecord::Base
    has_many :cities
    has_many :mobile_users
end
