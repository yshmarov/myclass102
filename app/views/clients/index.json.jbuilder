json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :middle_name, :last_name, :email, :tel1, :tel2, :dob, :sex, :address, :lead_source_id, :tenant_id
  json.url client_url(client, format: :json)
end
