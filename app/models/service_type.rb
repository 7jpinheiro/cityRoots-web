# == Schema Information
#
# Table name: service_types
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :string(255)
#

class ServiceType < ActiveRecord::Base
  belongs_to :service, dependent: :destroy
  belongs_to :type , dependent: :destroy
end
