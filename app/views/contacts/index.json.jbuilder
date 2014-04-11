json.array!(@contacts) do |contact|
  json.extract! contact, :id, :index
  json.url contact_url(contact, format: :json)
end
