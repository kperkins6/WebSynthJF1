# for more details see: http://emberjs.com/guides/models/defining-models/

WebSynth.SequencerTag = DS.Model.extend
  str: DS.attr 'string'
  sequencerId: DS.attr 'number'
