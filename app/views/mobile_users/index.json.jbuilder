json.array!(@mobile_users) do |mobile_user|
  json.extract! mobile_user, :username, :active, :country_id
  json.url mobile_user_url(mobile_user, format: :json)
end
