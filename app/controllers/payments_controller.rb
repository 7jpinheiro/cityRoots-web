class PaymentsController < ApplicationController

  def create
    @payment = Payment.new(payments_params)
    @payment.ip_address = request.remote_ip
    if @payment.save
      if @payment.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end

end
