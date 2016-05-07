json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :event_id, :client_id, :attendance_rate_id, :tenant_id
  json.url attendance_url(attendance, format: :json)
end
