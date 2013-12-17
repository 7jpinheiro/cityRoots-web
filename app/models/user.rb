class User < ActiveRecord::Base
<<<<<<< HEAD
=======
	validates :email , presence: true
	validates :encrypted_password , presence: true
	validates :city_id , presence: false
	validates :language_id , presence: false
	belongs_to :city
	belongs_to :language
	
>>>>>>> 991ee0e7b2fd2f3972c9c0f512b430469ebb2ad4
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
