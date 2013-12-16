json.array!(@comment_attractions) do |comment_attraction|
  json.extract! comment_attraction, :comment, :evaluationdate, :mobile_user_id, :attraction_id
  json.url comment_attraction_url(comment_attraction, format: :json)
end
