json.array!(@comments_itineraries) do |comments_itinerary|
  json.extract! comments_itinerary, :comment, :evalutiondate, :user_mobile_id, :itinerary_id
  json.url comments_itinerary_url(comments_itinerary, format: :json)
end
