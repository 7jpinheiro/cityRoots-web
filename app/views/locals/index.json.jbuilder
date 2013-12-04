json.array!(@locals) do |local|
  json.extract! local, :name, :description, :schedule, :site, :email, :address, :coord, :transport, :reference_point, :active, :timestamp, :city_id, :user_web_id
  json.url local_url(local, format: :json)
end
