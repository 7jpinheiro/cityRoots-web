class PaymentsController < ApplicationController


  def new
  end



  def create
    puts params[:payment].inspect
    @payment = Payment.new(request.remote_ip, params[:payment][:value],params[:payment])
     if @payment.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
  end

end
