json.array!(@attendance_rates) do |attendance_rate|
  json.extract! attendance_rate, :id, :name, :rate, :tenant_id
  json.url attendance_rate_url(attendance_rate, format: :json)
end
