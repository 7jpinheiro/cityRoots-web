json.array!(@rating_services) do |rating_service|
  json.extract! rating_service, :rating, :evaluationdate, :mobile_user_id, :service_id
  json.url rating_service_url(rating_service, format: :json)
end
