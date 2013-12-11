json.array!(@comments_services) do |comments_service|
  json.extract! comments_service, :comment, :evalutiondate, :mobile_user_id, :service_id
  json.url comments_service_url(comments_service, format: :json)
end
