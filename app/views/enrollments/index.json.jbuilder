json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :course_id, :client_id, :tenant_id, :member_id, :coupon_id
  json.url enrollment_url(enrollment, format: :json)
end
