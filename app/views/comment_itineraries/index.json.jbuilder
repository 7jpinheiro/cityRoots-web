json.array!(@comment_itineraries) do |comment_itinerary|
  json.extract! comment_itinerary, :comment, :evalutiondate, :mobile_user_id, :itinerary_id
  json.url comment_itinerary_url(comment_itinerary, format: :json)
end
