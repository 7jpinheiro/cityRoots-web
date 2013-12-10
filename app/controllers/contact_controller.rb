class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message enviado com sucesso.")
    else
      flash.now.alert = "Preencha todos os campos!"
      render :new
    end
  end

end