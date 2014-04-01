json.array!(@lineitems) do |lineitem|
  json.extract! lineitem, :id, :quantity, :price
  json.url lineitem_url(lineitem, format: :json)
end
