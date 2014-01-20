class RegistrationController < ApplicationController

    def new
        @user = User.new
        @city = City.new
    end

    def create

        @user = user.new
        @user.username = params[:user][:username]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation =params[:user][:password_confirmation]


        @city = City.new
        @city.city_id = params[:city][:id]

        @country = Country.new
        @country.country_id = params[:country][:id]

        @user.valid?

        if @user.errors.blank?
            @user.save
            @city.save
            @country.save

        else
            render "new"
        end
    end
end
