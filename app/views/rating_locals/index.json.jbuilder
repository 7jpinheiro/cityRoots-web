json.array!(@rating_locals) do |rating_local|
  json.extract! rating_local, :rating, :evaluationdate, :user_mobile_id, :local_id
  json.url rating_local_url(rating_local, format: :json)
end
