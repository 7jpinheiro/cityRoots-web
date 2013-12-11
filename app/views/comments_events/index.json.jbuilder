json.array!(@comments_events) do |comments_event|
  json.extract! comments_event, :comment, :evalutiondate, :mobile_user_id, :event_id
  json.url comments_event_url(comments_event, format: :json)
end
