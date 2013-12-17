json.array!(@itinerary_services) do |itinerary_service|
  json.extract! itinerary_service, :itinerary_id, :service_id
  json.url itinerary_service_url(itinerary_service, format: :json)
end
