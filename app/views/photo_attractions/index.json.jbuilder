json.array!(@photo_attractions) do |photo_attraction|
  json.extract! photo_attraction, :url, :name, :description, :extension
  json.url photo_attraction_url(photo_attraction, format: :json)
end
