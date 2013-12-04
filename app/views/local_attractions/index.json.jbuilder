json.array!(@local_attractions) do |local_attraction|
  json.extract! local_attraction, :details, :price, :attraction_type
  json.url local_attraction_url(local_attraction, format: :json)
end
