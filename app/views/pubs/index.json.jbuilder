json.array!(@pubs) do |pub|
  json.extract! pub, :id, :name, :address, :zipcode, :phone, :timing, :takesreservation, :parking, :goodforgroups, :ambience, :noiselevel, :goodfordancing, :alcoho, :happyhour, :smoking, :hastv, :bar
  json.url pub_url(pub, format: :json)
end
