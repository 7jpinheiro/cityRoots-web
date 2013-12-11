json.array!(@itinerary_types) do |itinerary_type|
  json.extract! itinerary_type, :name, :description
  json.url itinerary_type_url(itinerary_type, format: :json)
end
