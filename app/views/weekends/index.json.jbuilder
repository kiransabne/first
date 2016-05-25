json.array!(@weekends) do |weekend|
  json.extract! weekend, :id, :Hangouts, :name, :address, :description, :placesvisited
  json.url weekend_url(weekend, format: :json)
end
