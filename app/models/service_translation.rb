# == Schema Information
#
# Table name: service_translations
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  schedule    :text
#  description :text
#  transport   :string(100)
#  service_id  :integer          not null
#  language_id :integer          not null
#

class ServiceTranslation < ActiveRecord::Base

  validates :name, length: {minimum: 3}
  validates :description, length: {minimum: 3}
  validates :schedule, length: {minimum: 3}
  validates :transport, length: {minimum: 3}

  belongs_to :service

end
