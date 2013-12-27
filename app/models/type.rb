class Type < ActiveRecord::Base
  has_many :event_type, dependent: :destroy
  has_many :attraction_type, dependent: :destroy
  has_many :service_type, dependent: :destroy
end
