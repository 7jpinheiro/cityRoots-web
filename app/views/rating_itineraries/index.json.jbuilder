json.array!(@rating_itineraries) do |rating_itinerary|
  json.extract! rating_itinerary, :rating, :evaluationdate, :mobile_user_id, :itinerary_id
  json.url rating_itinerary_url(rating_itinerary, format: :json)
end
