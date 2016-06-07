json.array!(@cash_collections) do |cash_collection|
  json.extract! cash_collection, :id, :office_id, :amount, :tenant_id
  json.url cash_collection_url(cash_collection, format: :json)
end
