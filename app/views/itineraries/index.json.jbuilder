json.array!(@itineraries) do |itinerary|
  json.extract! itinerary, :name, :description, :itinerary_type_id
  json.url itinerary_url(itinerary, format: :json)
end
