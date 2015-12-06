json.array!(@sequencer_preset_users) do |sequencer_preset_user|
  json.extract! sequencer_preset_user, :id, :preset_id, :user_id
  json.url sequencer_preset_user_url(sequencer_preset_user, format: :json)
end
