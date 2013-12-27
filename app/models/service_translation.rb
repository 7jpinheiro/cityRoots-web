class ServiceTranslation < ActiveRecord::Base

  validates :name, length: {minimum: 3}
  validates :description, length: {minimum: 3}
  validates :schedule, length: {minimum: 3}
  validates :transport, length: {minimum: 3}

  belongs_to :service

end
