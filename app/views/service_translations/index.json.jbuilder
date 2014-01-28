json.array!(@service_translations) do |service_translation|
  json.extract! service_translation, :name, :schedule, :language, :description, :transport
  json.url service_translation_url(service_translation, format: :json)
end
