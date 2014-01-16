# == Schema Information
#
# Table name: web_users
#
#  id               :integer          not null, primary key
#  name             :string(100)      not null
#  enterprisename   :string(255)
#  nif              :string(20)
#  address          :string(255)
#  active           :boolean          not null
#  web_user_type_id :integer          not null
#  city_id          :integer
#

class WebUser < ActiveRecord::Base
	has_many :services
	has_many :events
	has_many :attractions
	has_many :web_user_packs
  belongs_to :city
  belongs_to :web_user_type
  belongs_to :user, :foreign_key => "id"
end
