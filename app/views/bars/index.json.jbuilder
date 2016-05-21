json.array!(@bars) do |bar|
  json.extract! bar, :id, :name, :address, :zipcode, :phone, :timing, :takesreservation, :parking, :goodforgroups, :ambience, :noiselevel, :goodfordancing, :alcohol, :happyhour, :smoking, :hastv
  json.url bar_url(bar, format: :json)
end
