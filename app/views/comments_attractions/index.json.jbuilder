json.array!(@comments_attractions) do |comments_attraction|
  json.extract! comments_attraction, :comment, :evalutiondate, :mobile_user_id, :attraction_id
  json.url comments_attraction_url(comments_attraction, format: :json)
end
