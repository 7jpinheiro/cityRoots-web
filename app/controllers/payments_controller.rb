class PaymentsController < ApplicationController

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

  def new
  end



  def create
    puts params[:payment].inspect
    @payment = Payment.new(request.remote_ip, params[:payment][:value],params[:payment])
     if @payment.purchase
        userpack = WebUserPack.new
        userpack.active = true
        userpack.subscriptiondate = Time.now
        userpack.validity = Time.now + 1.year
        userpack.web_user_id = current_user.id
        userpack.pack_type_id = 1
        userpack.obs = "Pack simples"
        userpack.save
        current_user.create_list_roles
        render :action => "success"
      else
        render :action => "failure"
      end
  end

end
