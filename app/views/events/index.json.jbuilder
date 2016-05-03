json.array!(@events) do |event|
  json.extract! event, :id, :starts_at, :room_id, :user_id, :course_id
  json.url event_url(event, format: :json)
end
