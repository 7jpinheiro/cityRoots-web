# == Schema Information
#
# Table name: web_user_packs
#
#  id               :integer          not null, primary key
#  subscriptiondate :date             not null
#  validity         :date             not null
#  obs              :string(255)
#  active           :boolean          not null
#  pack_type_id     :integer          not null
#  web_user_id      :integer          not null
#

class WebUserPack < ActiveRecord::Base
    has_many :services
    has_many :web_users_packs
    belongs_to :web_users_type
end
