# for more details see: http://emberjs.com/guides/models/defining-models/

WebSynth.SynthPresetUser = DS.Model.extend
  presetId: DS.attr 'number'
  userId: DS.attr 'number'
