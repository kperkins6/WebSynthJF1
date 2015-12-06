class SynthPresetSerializer < ActiveModel::Serializer
  attributes :id, :filename, :private, :user_id
end
