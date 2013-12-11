json.array!(@rating_attractions) do |rating_attraction|
  json.extract! rating_attraction, :rating, :evaluationdate, :mobile_user_id, :attraction_id
  json.url rating_attraction_url(rating_attraction, format: :json)
end
