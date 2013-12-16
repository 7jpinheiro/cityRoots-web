json.array!(@comment_services) do |comment_service|
  json.extract! comment_service, :comment, :evaluationdate, :mobile_user_id, :service_id
  json.url comment_service_url(comment_service, format: :json)
end
