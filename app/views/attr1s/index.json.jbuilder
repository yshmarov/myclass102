json.array!(@attr1s) do |attr1|
  json.extract! attr1, :id, :name, :tenant_id
  json.url attr1_url(attr1, format: :json)
end
