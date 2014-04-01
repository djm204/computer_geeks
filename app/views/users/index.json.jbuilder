json.array!(@users) do |user|
  json.extract! user, :id, :password, :first_name, :last_name, :default_ship, :default_bill, :email, :active
  json.url user_url(user, format: :json)
end
