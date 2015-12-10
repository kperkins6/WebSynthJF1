json.array!(@events) do |event|
  json.extract! event, :id, :title, :date, :location, :eventType, :schedule_id
  json.url event_url(event, format: :json)
end
