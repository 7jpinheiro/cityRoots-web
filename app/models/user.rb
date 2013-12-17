class User < ActiveRecord::Base
	validates :email, :encrypted_password, :city_id, :language_id, presence: true
	belongs_to :city
	belongs_to :language
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
