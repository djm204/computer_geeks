json.array!(@abouts) do |about|
  json.extract! about, :id, :index
  json.url about_url(about, format: :json)
end
