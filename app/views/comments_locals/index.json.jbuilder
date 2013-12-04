json.array!(@comments_locals) do |comments_local|
  json.extract! comments_local, :comment, :evalutiondate, :user_mobile_id, :local_id
  json.url comments_local_url(comments_local, format: :json)
end
