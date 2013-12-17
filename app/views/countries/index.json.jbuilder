json.array!(@countries) do |country|
  json.extract! country, :name, :abv
  json.url country_url(country, format: :json)
end
