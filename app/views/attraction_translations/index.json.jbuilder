json.array!(@attraction_translations) do |attraction_translation|
  json.extract! attraction_translation, :name, :schedule, :language, :description, :transport
  json.url attraction_translation_url(attraction_translation, format: :json)
end
