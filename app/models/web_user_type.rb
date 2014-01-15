# == Schema Information
#
# Table name: web_user_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class WebUserType < ActiveRecord::Base
  has_many  :web_users
end
