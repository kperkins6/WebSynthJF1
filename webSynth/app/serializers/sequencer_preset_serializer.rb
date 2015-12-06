class SequencerPresetSerializer < ActiveModel::Serializer
  attributes :id, :filename, :private, :user_id
end
