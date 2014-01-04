class Type < ActiveRecord::Base

  has_many :event_types, dependent: :destroy
  has_many :attraction_types, dependent: :destroy
  has_many :service_types, dependent: :destroy

end
