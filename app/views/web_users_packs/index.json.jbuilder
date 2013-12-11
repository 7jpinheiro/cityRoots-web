json.array!(@web_users_packs) do |web_users_pack|
  json.extract! web_users_pack, :subscriptiondate, :validity, :obs, :active, :pack_type_id, :web_user_id
  json.url web_users_pack_url(web_users_pack, format: :json)
end
