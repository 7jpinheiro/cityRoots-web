json.array!(@comments_itineraries) do |comments_itinerary|
  json.extract! comments_itinerary, :comment, :evalutiondate, :mobile_user_id, :itinerary_id
  json.url comments_itinerary_url(comments_itinerary, format: :json)
end
