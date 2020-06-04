json.data do
  json.array! @activity_logs do |log|
    json.extract! log, :id, :baby_id, :assistant_id, :activity_id, :name, :comments, :duration
    json.start_time(log.start_time&.utc&.strftime('%FT%T'))
    json.stop_time(log.stop_time&.utc&.strftime('%FT%T'))
  end
end
