class ImportsController < ApplicationController
  def index
  end
  def download_servico
  		send_file Rails.root.join('public', 'attractions.xlsx'), :type=>"application/xlsx", :x_sendfile=>true
  end
  
  def download_ponto
  	send_file Rails.root.join('public', 'attractions.xlsx'), :type=>"application/xlsx", :x_sendfile=>true
  end

  def download_evento
  	send_file Rails.root.join('public', 'attractions.xlsx'), :type=>"application/xlsx", :x_sendfile=>true
  end

end
