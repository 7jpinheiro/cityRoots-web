
class User < ActiveRecord::Base
	validates :email , presence: true
	validates :encrypted_password , presence: true
	validates :city_id , presence: false
	validates :language_id , presence: true
	belongs_to :city
	belongs_to :language
  has_one :web_user, :foreign_key => "id"
  has_one :mobile_user, :foreign_key => "id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :init_variables

  def init_variables
    puts "--------------------- INIT ---------------------"
    @list_roles = Array.new
  end

  def create_list_roles

    puts "create ---------------------" + @list_roles.inspect + "-----------------------------"
    if self.web_user
      @list_roles.push "restauracao" if self.web_user.web_user_type.name == "Restauração"
      @list_roles.push "entidade" if self.web_user.web_user_type.name == "Turismo/Câmara"
    end
    @list_roles.push "mobile" if self.mobile_user
  end


  def role?(arg)
    create_list_roles if @list_roles.blank?

    puts "---------------------" + @list_roles.inspect + "-----------------------------"
    @list_roles.include? arg.to_s
  end
end

