json.array!(@attraction_big_types) do |attraction_big_type|
  json.extract! attraction_big_type, :name, :description
  json.url attraction_big_type_url(attraction_big_type, format: :json)
end
