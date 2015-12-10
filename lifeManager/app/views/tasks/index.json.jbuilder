json.array!(@tasks) do |task|
  json.extract! task, :id, :str, :finished, :checklist_id
  json.url task_url(task, format: :json)
end
