class User::ParameterSanitizer < Devise::ParameterSanitizer

    private

    def account_update
        default_params.permit(:city_id, :email, :password, :password_confirmation, :language_id,:username,:country_id);
    end


end

