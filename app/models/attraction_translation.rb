class AttractionTranslation < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :language
end
