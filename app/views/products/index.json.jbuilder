json.array!(@products) do |product|
  json.extract! product, :id, :name, :event_quantity, :event_length, :member_price, :client_price, :gtype, :ctype, :is_active, :product_type_id, :tenant_id
  json.url product_url(product, format: :json)
end
