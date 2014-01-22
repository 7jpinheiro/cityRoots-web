# == Schema Information
#
# Table name: event_translations
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  schedule    :text
#  price       :text             not null
#  description :text
#  transport   :string(100)
#  program     :text
#  event_id    :integer          not null
#  language_id :integer          not null
#

class EventTranslation < ActiveRecord::Base
  validates :schedule, presence: false
  validates :transport, presence: false
  validates :program, presence: false
  validates :price, presence: false

  belongs_to :event
  belongs_to :language
end
