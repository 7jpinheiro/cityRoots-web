json.array!(@types) do |type|
  json.extract! type, :name, :description
  json.url type_url(type, format: :json)
end
