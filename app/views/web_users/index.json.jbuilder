json.array!(@web_users) do |web_user|
  json.extract! web_user, :name, :enterprisename, :nif, :address, :email, :username, :pass, :active, :user_web_type_id, :city_id
  json.url web_user_url(web_user, format: :json)
end
