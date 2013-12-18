# == Schema Information
#
# Table name: countries
#
#  id   :integer          not null, primary key
#  name :string(100)      not null
#  abv  :string(10)       not null
#

class Country < ActiveRecord::Base
    validates :name, presence:true
    validates :abv, presence:true
    has_many :cities, dependent: :destroy
    has_many :mobile_users, dependent: :destroy
end
