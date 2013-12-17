class User < ActiveRecord::Base
	validates :email , presence: true
	validates :encrypted_password , presence: true
	validates :city_id , presence: false
	validates :language_id , presence: false
	belongs_to :city
	belongs_to :language
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
