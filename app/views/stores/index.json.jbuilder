json.array!(@stores) do |store|
  json.extract! store, :name, :location, :map
  json.url store_url(store, format: :json)
end
