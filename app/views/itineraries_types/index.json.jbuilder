json.array!(@itineraries_types) do |itineraries_type|
  json.extract! itineraries_type, :name, :description
  json.url itineraries_type_url(itineraries_type, format: :json)
end
