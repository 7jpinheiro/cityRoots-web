json.array!(@web_users) do |web_user|
  json.extract! web_user, :name, :enterprisename, :obs, :nif, :address, :active, :web_user_type_id, :city_id
  json.url web_user_url(web_user, format: :json)
end
