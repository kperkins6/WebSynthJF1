json.array!(@sequencer_presets) do |sequencer_preset|
  json.extract! sequencer_preset, :id, :filename, :private, :user_id
  json.url sequencer_preset_url(sequencer_preset, format: :json)
end
