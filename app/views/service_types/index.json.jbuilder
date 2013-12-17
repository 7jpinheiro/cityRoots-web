json.array!(@service_types) do |service_type|
  json.extract! service_type, :name, :description
  json.url service_type_url(service_type, format: :json)
end
