json.array!(@synth_presets) do |synth_preset|
  json.extract! synth_preset, :id, :filename, :private, :user_id
  json.url synth_preset_url(synth_preset, format: :json)
end
