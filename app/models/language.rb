# == Schema Information
#
# Table name: languages
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  abv         :string(10)       not null
#  description :string(255)
#

class Language < ActiveRecord::Base
	belongs_to :user
end
