json.array!(@departments_stores) do |departments_store|
  json.extract! departments_store, :department_id, :store_id
  json.url departments_store_url(departments_store, format: :json)
end
