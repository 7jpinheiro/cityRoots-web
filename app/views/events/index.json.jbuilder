json.array!(@events) do |event|
  json.extract! event, :site,:email,:address,:latitude,:longitude,:startdate,:enddate,:organization,:price,:program,:rating,:accessibility,:city_id,:timestamp,:active,:web_user_id
  json.url event_url(event, format: :json)
end
