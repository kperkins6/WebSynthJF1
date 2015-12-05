json.array!(@sequencer_tags) do |sequencer_tag|
  json.extract! sequencer_tag, :id, :str, :sequencer_id
  json.url sequencer_tag_url(sequencer_tag, format: :json)
end
