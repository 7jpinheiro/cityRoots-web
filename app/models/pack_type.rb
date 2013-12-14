# == Schema Information
#
# Table name: pack_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#  duration    :integer          not null
#  price       :integer          not null
#

class PackType < ActiveRecord::Base
    has_many :web_users_packs	
end
