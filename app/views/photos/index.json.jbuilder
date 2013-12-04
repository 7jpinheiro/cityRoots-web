json.array!(@photos) do |photo|
  json.extract! photo, :url, :name, :description, :extension
  json.url photo_url(photo, format: :json)
end
