class WebUserPack < ActiveRecord::Base
    has_many :services
    has_many :web_users_packs
    belongs_to :web_users_type
end
