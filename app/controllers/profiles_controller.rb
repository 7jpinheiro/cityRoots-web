class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    userweb=WebUser.where("id=?",current_user.id).first
    if(userweb.nil?)
      redirect_to new_web_user_path
    end
  end

  def edit

  end
end
