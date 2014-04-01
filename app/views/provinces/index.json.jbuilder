json.array!(@provinces) do |province|
  json.extract! province, :id, :name, :pst_rate, :gst_rate, :hst_rate
  json.url province_url(province, format: :json)
end
