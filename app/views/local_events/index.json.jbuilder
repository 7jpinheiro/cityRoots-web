json.array!(@local_events) do |local_event|
  json.extract! local_event, :stardate, :enddate, :organization, :price, :program, :event_type_id
  json.url local_event_url(local_event, format: :json)
end
