json.array!(@expences) do |expence|
  json.extract! expence, :id, :member_id, :amount, :tenant_id
  json.url expence_url(expence, format: :json)
end
