json.array!(@pack_types) do |pack_type|
  json.extract! pack_type, :name, :description, :duration, :price
  json.url pack_type_url(pack_type, format: :json)
end
