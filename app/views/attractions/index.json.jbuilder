json.array!(@attractions) do |attraction|
  json.extract! attraction, :name, :description, :schedule, :site, :email, :address, :latitude, :longitude, :transport, :reference_point, :active, :timestamp, :price, :attraction_type_id, :city_id, :web_user_id
  json.url attraction_url(attraction, format: :json)
end
