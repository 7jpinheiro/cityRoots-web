class PaymentsController < ApplicationController


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
        render :action => "success"
      else
        render :action => "failure"
      end
  end

end
