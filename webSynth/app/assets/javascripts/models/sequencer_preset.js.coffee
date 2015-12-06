# for more details see: http://emberjs.com/guides/models/defining-models/

WebSynth.SequencerPreset = DS.Model.extend
  filename: DS.attr 'string'
  private: DS.attr 'boolean'
  userId: DS.attr 'number'
