json.array!(@courses) do |course|
  json.extract! course, :id, :name, :product_id, :attr1_id, :attr2_id, :attr3_id, :tenant_id
  json.url course_url(course, format: :json)
end
