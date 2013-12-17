json.array!(@web_user_packs) do |web_user_pack|
  json.extract! web_user_pack, :subscriptiondate, :validity, :obs, :active, :pack_type_id, :web_user_id
  json.url web_user_pack_url(web_user_pack, format: :json)
end
