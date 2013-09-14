json.array!(@items) do |item|
  json.extract! item, :department_id, :name, :isle, :quantity
  json.url item_url(item, format: :json)
end
