json.array!(@services) do |service|
  json.extract! service, :site,:email,:address,:latitude,:longitude,:active,:reference_point,:capacity,:details,:rating,:accessibility,:city_id,:web_user_id
  json.url service_url(service, format: :json)
end
