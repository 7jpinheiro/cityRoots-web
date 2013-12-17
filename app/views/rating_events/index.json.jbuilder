json.array!(@rating_events) do |rating_event|
  json.extract! rating_event, :rating, :evaluationdate, :mobile_user_id, :event_id
  json.url rating_event_url(rating_event, format: :json)
end
