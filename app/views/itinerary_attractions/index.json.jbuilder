json.array!(@itinerary_attractions) do |itinerary_attraction|
  json.extract! itinerary_attraction, :itinerary_id, :attraction_id
  json.url itinerary_attraction_url(itinerary_attraction, format: :json)
end
