json.array!(@addresses) do |address|
  json.extract! address, :id, :address, :city, :country, :postal_code
  json.url address_url(address, format: :json)
end
