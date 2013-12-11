json.array!(@photo_services) do |photo_service|
  json.extract! photo_service, :url, :name, :description, :extension
  json.url photo_service_url(photo_service, format: :json)
end
