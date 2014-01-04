json.array!(@attractions) do |attraction|
  json.extract! attraction, :site, :email, :address, :latitude, :longitude, :reference_point, :active, :timestamp, :price, :attraction_type_id, :city_id, :web_user_id
  json.url attraction_url(attraction, format: :json)
end
