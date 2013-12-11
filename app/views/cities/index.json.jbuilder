json.array!(@cities) do |city|
  json.extract! city, :name, :abv, :country_id
  json.url city_url(city, format: :json)
end
