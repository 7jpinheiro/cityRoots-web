# == Schema Information
#
# Table name: attraction_translations
#
#  id            :integer          not null, primary key
#  name          :string(100)      not null
#  price         :text
#  schedule      :text
#  description   :text
#  transport     :string(100)
#  attraction_id :integer          not null
#  language_id   :integer          not null
#

class AttractionTranslation < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :language
end
