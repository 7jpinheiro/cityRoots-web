# == Schema Information
#
# Table name: service_types
#
#  id         :integer          not null, primary key
#  service_id :integer          not null
#  type_id    :integer          not null
#

class ServiceType < ActiveRecord::Base
  belongs_to :service
  belongs_to :type
end
