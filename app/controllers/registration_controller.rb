class RegistrationController < ApplicationController

    def new
        @user = User.new
        @city = City.new
    end

    def create

        @user = user.new
        # @user.username = params[:member][:username]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation =params[:user][:password_confirmation]


        @city = City.new
        @city.city_id = params[:city][:id]


        @user.valid?

        if @user.errors.blank?
            @user.save
            @city.save
        else
            render :action => "new"
        end
    end
end
