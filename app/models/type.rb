# == Schema Information
#
# Table name: types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class Type < ActiveRecord::Base

  has_many :event_types, dependent: :destroy
  has_many :attraction_types, dependent: :destroy
  has_many :service_types, dependent: :destroy

end
