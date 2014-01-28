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
	validates :nif, uniqueness: true
	has_many :services, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :attractions, dependent: :destroy
	has_many :web_user_packs, dependent: :destroy
  belongs_to :city
  belongs_to :web_user_type
  belongs_to :user, :foreign_key => "id"
end
