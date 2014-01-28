json.array!(@web_user_types) do |web_user_type|
  json.extract! web_user_type, :name, :description
  json.url web_user_type_url(web_user_type, format: :json)
end
