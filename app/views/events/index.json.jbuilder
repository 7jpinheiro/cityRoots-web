json.array!(@events) do |event|
  json.extract! event, :name, :description, :schedule, :site, :email, :address, :coord, :transport, :active, :timestamp, :stardate, :enddate, :organization, :price, :program, :event_type_id, :city_id, :web_user_id
  json.url event_url(event, format: :json)
end
