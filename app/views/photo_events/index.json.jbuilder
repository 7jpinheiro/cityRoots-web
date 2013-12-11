json.array!(@photo_events) do |photo_event|
  json.extract! photo_event, :url, :name, :description, :extension
  json.url photo_event_url(photo_event, format: :json)
end
