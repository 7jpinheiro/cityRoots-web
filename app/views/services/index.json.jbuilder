json.array!(@services) do |service|
  json.extract! service, :name, :description, :schedule, :site, :email, :address, :coord, :transport, :reference_point, :active, :timestamp, :capacity, :details, :service_type_id, :city_id, :web_user_id
  json.url service_url(service, format: :json)
end
