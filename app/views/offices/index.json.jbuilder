json.array!(@offices) do |office|
  json.extract! office, :id, :name, :address, :email, :tel, :tenant_id
  json.url office_url(office, format: :json)
end
