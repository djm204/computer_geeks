json.array!(@watcheditems) do |watcheditem|
  json.extract! watcheditem, :id
  json.url watcheditem_url(watcheditem, format: :json)
end
