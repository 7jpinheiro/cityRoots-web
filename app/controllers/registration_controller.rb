class RegistrationController < ApplicationController

    def new
        @user = User.new;
    end

    def create 

        @user = user.new
        # @user.username = params[:member][:username]
        @user.email = params[:member][:email]
        @user.password = params[:member][:password]
        @user.password_confirmation =params[:member][:password_confirmation]


        @user.valid?

        if @user.errors.blank?
            @user.save
        else
            render :action => "new"
        end


    end

end
