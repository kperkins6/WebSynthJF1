# for more details see: http://emberjs.com/guides/models/defining-models/

WebSynth.SequencerPresetUser = DS.Model.extend
  presetId: DS.attr 'number'
  userId: DS.attr 'number'
