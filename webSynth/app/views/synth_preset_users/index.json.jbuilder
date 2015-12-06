json.array!(@synth_preset_users) do |synth_preset_user|
  json.extract! synth_preset_user, :id, :preset_id, :user_id
  json.url synth_preset_user_url(synth_preset_user, format: :json)
end
