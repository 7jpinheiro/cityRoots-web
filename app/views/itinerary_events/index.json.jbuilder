json.array!(@itinerary_events) do |itinerary_event|
  json.extract! itinerary_event, :itinerary_id, :event_id
  json.url itinerary_event_url(itinerary_event, format: :json)
end
