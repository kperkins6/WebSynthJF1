class CreateSequencerPresets < ActiveRecord::Migration
  def change
    create_table :sequencer_presets do |t|
      t.string :filename
      t.boolean :private
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
