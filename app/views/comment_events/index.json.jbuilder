json.array!(@comment_events) do |comment_event|
  json.extract! comment_event, :comment, :evaluationdate, :mobile_user_id, :event_id
  json.url comment_event_url(comment_event, format: :json)
end
