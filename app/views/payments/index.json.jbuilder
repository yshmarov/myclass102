json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :payment_type, :enrollment_id, :office_id, :member_id, :tenant_id
  json.url payment_url(payment, format: :json)
end
