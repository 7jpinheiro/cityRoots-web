json.array!(@attractions) do |attraction|
  json.extract! attraction, :name, :description, :schedule, :site, :email, :address, :coord, :transport, :reference_point, :active, :timestamp, :details, :price, :attraction_type_id, :city_id, :web_user_id
  json.url attraction_url(attraction, format: :json)
end
