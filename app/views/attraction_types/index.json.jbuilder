json.array!(@attraction_types) do |attraction_type|
  json.extract! attraction_type, :name, :description, :attraction_big_types_id
  json.url attraction_type_url(attraction_type, format: :json)
end
