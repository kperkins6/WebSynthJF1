json.array!(@synth_tags) do |synth_tag|
  json.extract! synth_tag, :id, :str, :synth_id
  json.url synth_tag_url(synth_tag, format: :json)
end
