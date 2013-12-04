json.array!(@local_services) do |local_service|
  json.extract! local_service, :capacity, :details, :service_type_id
  json.url local_service_url(local_service, format: :json)
end
