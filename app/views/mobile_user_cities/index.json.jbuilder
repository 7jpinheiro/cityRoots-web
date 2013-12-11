json.array!(@mobile_user_cities) do |mobile_user_city|
  json.extract! mobile_user_city, :city_id, :mobile_user_id
  json.url mobile_user_city_url(mobile_user_city, format: :json)
end
