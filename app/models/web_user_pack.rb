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
    validates :subscriptiondate, presence:true
    validates :validity, presence:true
    validates :pack_type_id, presence:true
    validates :web_user_id, presence:true
    has_many :services, dependent: :destroy
    belongs_to :web_users_type
    belongs_to :web_user
    belongs_to :pack_type
end
