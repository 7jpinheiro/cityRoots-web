json.array!(@event_translations) do |event_translation|
  json.extract! event_translation, :name, :schedule, :language, :description, :transport
  json.url event_translation_url(event_translation, format: :json)
end
