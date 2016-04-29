json.array!(@touristspots) do |touristspot|
  json.extract! touristspot, :id, :name, :location, :shortinfo, :description
  json.url touristspot_url(touristspot, format: :json)
end
